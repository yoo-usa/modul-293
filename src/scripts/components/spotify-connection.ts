const clientId: string = process.env.SPOTIFY_CLIENT_ID!;
const clientSecret: string = process.env.SPOTIFY_CLIENT_SECRET!;

const list: HTMLElement = document.querySelector(".song-titles__list")!;
let oldArtist: string = "";

interface Track {
  name: string;
  popularity: number;
  artists: Artist[];
}

interface Artist {
  id: string;
  name: string;
  uri: string;
  external_urls: { spotify: string };
  images: { url: string }[];
}

interface SpotifyTracksResponse {
  tracks: {
    items: Track[];
  };
}

function listAllSongs(allSongs: Track[]) {
  list.innerHTML = "";
  if (allSongs.length > 0 && oldArtist !== allSongs[0].artists[0].id) {
    setLogo(allSongs[0].artists[0].uri);
    oldArtist = allSongs[0].artists[0].id;
  }
  allSongs.forEach((song: Track, index: number) => {
    const songTitle = document.createElement("li");
    songTitle.classList.add("song-titles__list-item");
    songTitle.innerHTML = `${index + 1}. <b>${song.name}</b> - <a href="${song.artists[0].external_urls.spotify}" class="song-artist">${song.artists[0].name}</a>`;
    list.appendChild(songTitle);
  });
}

const search: HTMLInputElement = document.querySelector(".container-spotify__search") as HTMLInputElement;

search?.addEventListener("input", async (e: Event) => {
  e.preventDefault();
  if (search.value) {
    const allSongs: Track[] = await getAllSongsBySpecificArtist(search.value);
    listAllSongs(allSongs);
  }
});

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
        const logo:HTMLLinkElement = document.querySelector(".navbar__logo")!;
        logo.href = data.external_urls.spotify;
        logo.style.backgroundImage = `url(${data.images[0].url})`;
      }
    })
    .catch((error) => console.error("Error:", error));
}
