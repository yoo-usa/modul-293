const clientId: string = "94c50c85e2924978abcb86d642c25ac4";//process.SPOTIFY_CLIENT_ID!;
const clientSecret: string = "d8eed1006d3d42b79796792497add54a";// process.env.SPOTIFY_CLIENT_SECRET!;

const list: HTMLElement = document.querySelector<HTMLElement>(".spotify-connection__list")!;
let oldArtist: string = "";
let lastSong: HTMLLIElement;
const search: HTMLInputElement = document.querySelector(".spotify-connection__search") as HTMLInputElement;
const audio: HTMLAudioElement = document.querySelector(".spotify-connection__audio") as HTMLAudioElement;

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
  preview_url: string;
}

interface Artist {
  id: string;
  name: string;
  href: string;
  external_urls: { spotify: string };
  images: { url: string }[];
}

// interface SpotifyTracksResponse {
//   tracks: {
//     items: Track[];
//   };
// }

async function listAllSongs(allSongs: Track[]) {
  list.innerHTML = "";
  if (allSongs.length > 0 && oldArtist !== allSongs[0].artists[0].id) {
    await setLogo(allSongs[0].artists[0].href);
    oldArtist = allSongs[0].artists[0].id;
  }
  allSongs.forEach((song: Track, index: number) => {
    const songTitle = document.createElement("li");
    songTitle.classList.add("spotify-connection__list-item");
    songTitle.dataset.song = song.preview_url;
    songTitle.innerHTML = `${index + 1}. <a href="" class="spotify-connection__song"><b>${song.name}</b></a> - <a href="${song.artists[0].external_urls.spotify}" class="spotify-connection__artist">${song.artists[0].name}</a>`;
    songTitle.addEventListener("click", () => currentSong(songTitle))
    list.appendChild(songTitle);
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
        const logo: HTMLLinkElement = document.querySelector<HTMLLinkElement>(".navbar__desktop-content-logo")!;
        logo.href = data.external_urls.spotify;
        logo.style.backgroundImage = `url(${data.images[0].url})`;
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
  if (lastSong.dataset.song) {
    audio.src = lastSong.dataset.song;
  }
}
