import { Loader } from "@googlemaps/js-api-loader";

export const init = () => {
  const loader = new Loader({
    apiKey: "AIzaSyDErYHyA-Qn6QkXqS6lCxkpk_-jWX_4-fQ",
    version: "weekly",
  });
  loader.load().then(async () => {
    // In this example, we center the map, and add a marker, using a LatLng object
    // literal instead of a google.maps.LatLng object. LatLng object literals are
    // a convenient way to add a LatLng coordinate and, in most cases, can be used
    // in place of a google.maps.LatLng object.
    let map: google.maps.Map;

      const mapOptions = {
        zoom: 20,
        center: { lat: 37.51457587272004, lng: 127.10249569677539 }
      };

      map = new google.maps.Map(
        document.getElementById("map") as HTMLElement,
        mapOptions
      );
      const marker = new google.maps.Marker({
        // The below line is equivalent to writing:
        // position: new google.maps.LatLng(-34.397, 150.644)
        position: { lat: 37.51457587272004, lng: 127.10249569677539 },
        map: map,
      });

      // You can use a LatLng literal in place of a google.maps.LatLng object when
      // creating the Marker object. Once the Marker object is instantiated, its
      // position will be available as a google.maps.LatLng object. In this case,
      // we retrieve the marker's position using the
      // google.maps.LatLng.getPosition() method.
      const infowindow = new google.maps.InfoWindow({
        // content: "<p>Marker Location:" + marker.getPosition() + "</p>",
        content: "<p> ONLY SIGMAS CAN ENTER </p>",
      });

      google.maps.event.addListener(marker, "click", () => {
        infowindow.open(map, marker);
      });
  }).catch(error => {
    console.error('Fehler beim Laden der Google Maps API:', error);
  });
};
