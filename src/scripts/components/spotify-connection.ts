const clientId: string = "94c50c85e2924978abcb86d642c25ac4";//process.SPOTIFY_CLIENT_ID!;
const clientSecret: string = "d8eed1006d3d42b79796792497add54a";// process.env.SPOTIFY_CLIENT_SECRET!;

let oldArtist: string = "";
let lastSong: HTMLLIElement;
const search: HTMLInputElement = document.querySelector(".spotify-connection__search") as HTMLInputElement;
const audio: HTMLIFrameElement = document.querySelector(".spotify-connection__audio") as HTMLIFrameElement;
const albumLink = document.querySelector<HTMLElement>(".spotify-connection__album-link") as HTMLLinkElement;
const list = document.querySelector<HTMLElement>(".spotify-connection__list");
const spinner = document.querySelector<HTMLElement>(".spotify-connection__spinner");

if(list && list.innerHTML.trim() == "") {
  for(let i = 0; i < 50; i++) {
    const li = document.createElement("li")
    li.classList.add("spotify-connection__list-item")
    li.addEventListener("click", () => currentSong(li));
    list.appendChild(li)
  }
}

export const init = () => { // rootEl: HTMLElement
  search?.addEventListener("input", async (e: Event) => {
    e.preventDefault();
    if (search.value) {
      const allSongs: Track[] = await getAllSongsBySpecificArtist(search.value);
      await listAllSongs(allSongs);
    }
  });
};

interface Track {
  name: string;
  popularity: number;
  artists: Artist[];
  album: Album;
  id: string;
}

interface Album {
  id: string;
}

interface Artist {
  id: string;
  name: string;
  href: string;
  images: { url: string }[];
}

async function listAllSongs(allSongs: Track[]) {
  const allElements: NodeListOf<HTMLLIElement> = document.querySelectorAll(".spotify-connection__list-item");

  if (allSongs.length > 0 && oldArtist !== allSongs[0].artists[0].id) {
    await setLogo(allSongs[0].artists[0].href);
    oldArtist = allSongs[0].artists[0].id;
  }
  if(spinner){
    spinner.classList.remove("spotify-connection__spinner--active");
  }
  allElements.forEach((li: HTMLLIElement, index: number) => {
    const song: Track = allSongs[index];
    const albumId: string = song.album.id;
    const songId: string = song.id;

    if(li.dataset.songId != songId) {
      li.classList.add("spotify-connection__list-item");
      li.innerHTML = `${index + 1}. <a href="" class="spotify-connection__song"><b>${song.name}</b></a> - <a href="https://open.spotify.com/artist/${song.artists[0].id}" class="spotify-connection__artist">${song.artists[0].name}</a>`;
      li.dataset.songId = songId;
      li.dataset.albumId = albumId;
    }
  });
}

async function getBearerToken(): Promise<string> {
  const response = await fetch("https://accounts.spotify.com/api/token", {
    credentials: "omit",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: `grant_type=client_credentials&client_id=${clientId}&client_secret=${clientSecret}`,
    method: "POST",
  });
  const data = await response.json();
  if (data.access_token) {
    return data.access_token;
  }
  throw new Error("Bearer token not retrieved");
}

async function getAllSongsBySpecificArtist(artist: string): Promise<Track[]> {
  if(spinner) {
    spinner.classList.add("spotify-connection__spinner--active");

  }

  const bearerToken = await getBearerToken();
  const response = await fetch(
    `https://api.spotify.com/v1/search?q=artist:${artist}&type=track&market=US&limit=50`,
    {
      headers: {
        Authorization: `Bearer ${bearerToken}`,
        "Content-Type": "application/json",
      },
    }
  );
  const data = await response.json();
  const tracks = data.tracks.items;
  return tracks.sort((a: Track, b: Track) => b.popularity - a.popularity);
}

async function setLogo(uri: string): Promise<void> {
  const access_token = await getBearerToken();

  await fetch(uri, {
    headers: {
      Authorization: `Bearer ${access_token}`,
    },
    method: "GET",
  })
    .then((response) => response.json())
    .then((data) => {
      if (data) {
        const logos = document.querySelectorAll<HTMLLinkElement>(".navbar__desktop-content-logo");
        if(logos) {
          logos.forEach(logo => {
            logo.href = data.external_urls.spotify;
            logo.style.backgroundImage = `url(${data.images[0].url})`;
          })
        }
      }
    })
    .catch((error) => console.error("Error:", error));
}

function currentSong(songTitle: HTMLLIElement) {
  if(lastSong) {
    lastSong.classList.remove("spotify-connection__list-item--active")
  }
  lastSong = songTitle;
  songTitle.classList.add("spotify-connection__list-item--active");
  if (songTitle.dataset.songId) {
    audio.src = `https://open.spotify.com/embed/track/${songTitle.dataset.songId}?utm_source=generator`;
  }
  if (songTitle.dataset.albumId) {
    albumLink.href = `/Album?albumId=${songTitle.dataset.albumId}`;
  }
}
