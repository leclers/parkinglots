import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';

const mapElementIndex = document.getElementById('map');
const mapElementShow = document.getElementById('map-show');

if (mapElementIndex) { // only build a map if there's a div#map to inject into
  mapboxgl.accessToken = process.env.MAPBOX_API_KEY; // API key from `.env`
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });

  const markers = JSON.parse(mapElementIndex.dataset.markers);

  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
      .setHTML(marker.infoWindow.content))
      .addTo(map);
  })

  if (markers.length === 0) {
    map.setZoom(1);
  } else if (markers.length === 1) {
    map.setZoom(14);
    map.setCenter([markers[0].lng, markers[0].lat]);
  } else {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });
    map.fitBounds(bounds, { duration: 0, padding: 75 })
  }
}

if (mapElementShow) { // only build a map if there's a div#map to inject into
  mapboxgl.accessToken = process.env.MAPBOX_API_KEY; // API key from `.env`
  const map = new mapboxgl.Map({
    container: 'map-show',
    style: 'mapbox://styles/mapbox/streets-v10'
  });

  const marker = JSON.parse(mapElementShow.dataset.marker);

  new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
    .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
    .setHTML(marker.infoWindow.content))
    .addTo(map);

  map.setZoom(14);
  map.setCenter([marker.lng, marker.lat]);

}
