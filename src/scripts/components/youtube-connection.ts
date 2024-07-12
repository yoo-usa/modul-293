let lastYouTubeVideo: HTMLLIElement | null = null;

export const init = async (rootEl: HTMLElement) => {
  const youtubeIFrame = rootEl.querySelector('.youtube-connection__youtube') as HTMLIFrameElement;
  const youtubeVideosList = rootEl.querySelector<HTMLUListElement>('.youtube-connection__youtube-videos');
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  const search = urlParams.get('q');
  const playButton = rootEl.querySelector<HTMLButtonElement>('.youtube-connection__youtube-watch')!;
  const wideButton = rootEl.querySelector<HTMLButtonElement>('.youtube-connection__youtube-wide')!;

  playButton.addEventListener('click', () => play(youtubeIFrame));
  wideButton.addEventListener('click', () => wide(youtubeIFrame, wideButton));

  if (search && youtubeVideosList) {
    try {
      let allYoutubeVideos: Youtube[];
      const cachedVideos = localStorage.getItem(`youtube-videos-${search}`);
      if (cachedVideos) {
        allYoutubeVideos = JSON.parse(cachedVideos);
      } else {
        allYoutubeVideos = await getYouTubeVideos(search);
        localStorage.setItem(`youtube-videos-${search}`, JSON.stringify(allYoutubeVideos));
      }
      await listYouTubeVideos(allYoutubeVideos, youtubeVideosList);
    } catch (error) {
      console.error('Error fetching YouTube videos:', error);
    }
  }
};

async function getYouTubeVideos(search: string): Promise<Youtube[]> {
  try {
    const response = await fetch(`https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=${search}&order=viewCount&type=video&key=AIzaSyDErYHyA-Qn6QkXqS6lCxkpk_-jWX_4-fQ`);
    const data = await response.json();
    if (data && data.items) {
      return data.items;
    } else {
      throw new Error('No data found');
    }
  } catch (error) {
    console.error('Error fetching YouTube videos:', error);
    throw error;
  }
}

async function listYouTubeVideos(videos: Youtube[], videosList: HTMLUListElement) {
  videosList.innerHTML = ''; // Clear the list before adding new items
  videos.forEach((video, index: number) => {
    const li = document.createElement('li');
    li.innerHTML = `${index + 1}. <a href="#" class="youtube-connection__song"><b>${video.snippet.title}</b></a> - <a href="#" class="youtube-connection__artist">${video.snippet.channelTitle}</a>`;
    li.dataset.id = video.id.videoId;
    li.classList.add('youtube-connection__list-item');
    li.addEventListener('click', () => currentSong(li));
    videosList.appendChild(li);
  });
}

function currentSong(youtubeVideo: HTMLLIElement) {
  if (lastYouTubeVideo) {
    lastYouTubeVideo.classList.remove('youtube-connection__list-item--active');
  }
  lastYouTubeVideo = youtubeVideo;
  youtubeVideo.classList.add('youtube-connection__list-item--active');
}

function play(youtubeIFrame: HTMLIFrameElement) {
  if (lastYouTubeVideo) {
    youtubeIFrame.src = `https://www.youtube.com/embed/${lastYouTubeVideo.dataset.id}?autoplay=1`;
    youtubeIFrame.classList.add('youtube-connection__youtube--active');
  } else {
    console.warn('No video selected to play.');
  }
}

function wide(youtubeIFrame: HTMLIFrameElement, wideButton: HTMLButtonElement) {
  youtubeIFrame.classList.toggle('youtube-connection__youtube--wide');
  wideButton.classList.toggle('youtube-connection__youtube-wide--off');
}

interface Youtube {
  id: Id,
  snippet: Snippet,
}

interface Snippet {
  title: string,
  channelTitle: string,
}

interface Id {
  kind: string,
  videoId: string,
}
