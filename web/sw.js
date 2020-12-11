const cacheVersion = 'v1';
const urlsToPrefetch = [
  'https://contato.app',
  'https://contato.app/miguel',
  'https://contato.app/dani',
];

this.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open(cacheVersion).then(function(cache) {
      return cache.addAll(urlsToPrefetch);
    })
  );
});


this.addEventListener('fetch', event => {
  let responsePromise = caches.match(event.request).then(response => {
    return response || fetch(event.request)
  });

  event.respondWith(responsePromise);
});