export const init = (rootEl: HTMLElement) => { // rootEl: HTMLElement
  const albumIFrame = rootEl.querySelector(".album-connection__album") as HTMLIFrameElement;
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  const albumId = urlParams.get('albumId');
  albumIFrame.src = `https://open.spotify.com/embed/album/${albumId}?utm_source=generator`
};
