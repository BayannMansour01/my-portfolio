'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "4d014b0c0b61e5592def1c06360c2f82",
"index.html": "63fe859d3f9cbe8e9c3d08311367e659",
"/": "63fe859d3f9cbe8e9c3d08311367e659",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "da1dcd8e0a97f2a8bab82e5ef2770532",
"assets/assets/images/projects/daliluna/daliluna-5.jpg": "820dd16f78831ccfb2d6ddb926a6bb17",
"assets/assets/images/projects/daliluna/daliluna-2.jpg": "5c59c2b0f4cc50e578ecaea9efb8d167",
"assets/assets/images/projects/daliluna/daliluna-0.jpg": "c015e6ad23a38e86f698b195f5830cdc",
"assets/assets/images/projects/daliluna/daliluna-4.jpg": "5343140a1a658534663696c0640f4fc7",
"assets/assets/images/projects/daliluna/daliluna-1.jpg": "b274298235bddc518af121c9a4880141",
"assets/assets/images/projects/daliluna/daliluna-3.jpg": "78017b8a005d094ee9430c2f3a9c6387",
"assets/assets/images/projects/daliluna/daliluna-6.jpg": "7c3a60fbde2fa085a7126c39bf7252ff",
"assets/assets/images/projects/manara/manara-3.jpg": "986a07d3a223a199a67081e55dbcc403",
"assets/assets/images/projects/manara/manara-4.jpg": "19ce2fc804e0fd297eb5a79f4a9889c9",
"assets/assets/images/projects/manara/manara-7.jpg": "464806568f2ba9d768133cd13844c21f",
"assets/assets/images/projects/manara/manara-5.jpg": "b8a7dd65dd9e66bb472b7dd88507bda7",
"assets/assets/images/projects/manara/manara-10.jpg": "f639996fd7b321cd7785dd2b33a0f670",
"assets/assets/images/projects/manara/manara-9.jpg": "fe763c87c934267225090429251f8533",
"assets/assets/images/projects/manara/manara-6.jpg": "d7f2b758c298bd11b218c3e33cebb132",
"assets/assets/images/projects/manara/manara-1.jpg": "5921528afd06baeaab5fe1fa5996d041",
"assets/assets/images/projects/manara/manara-8.jpg": "3114eb7cb07408d8013b6be19f48a60f",
"assets/assets/images/projects/manara/manara-2.jpg": "78789dd9b2a3c7a52ce09a78093c9014",
"assets/assets/images/projects/academic/academic-1.jpg": "d840bc16b3c8df0e7522dcf3843ee62b",
"assets/assets/images/projects/academic/academic-7.jpg": "d1845d4a19e21148ff35e7f142e05319",
"assets/assets/images/projects/academic/academic-6.jpg": "6d9c778ed60159054e2190f2730d9f58",
"assets/assets/images/projects/academic/academic-4.jpg": "1a5d2f406535a02410a27f5d312f0875",
"assets/assets/images/projects/academic/academic-2.jpg": "5c670eaaea3f231eaca804e8120f4a1b",
"assets/assets/images/projects/academic/academic-5.jpg": "d9d0db967e77a90ab1f4c6a52b586db2",
"assets/assets/images/projects/academic/academic-3.jpg": "7f609cf6ac7bb7fd93009bc09715738f",
"assets/assets/images/projects/daleelie/daleelie-6.jpg": "ad1005aadd4bc64ec6f33f22be2adf5a",
"assets/assets/images/projects/daleelie/daleelie-8.jpg": "0610a7302f1ee1675e8a4e3239670240",
"assets/assets/images/projects/daleelie/daleelie-1.jpg": "e9ca873271e618144f7bdac84f42dc80",
"assets/assets/images/projects/daleelie/daleelie-4.jpg": "fc7b75dc70754378031b013b1ac1f640",
"assets/assets/images/projects/daleelie/daleelie-7.jpg": "f3815f7e8c6b4eb0603015dc4b1b9634",
"assets/assets/images/projects/daleelie/daleelie-3.jpg": "7d11212c7a14c53f8e61f6f4c992c392",
"assets/assets/images/projects/daleelie/daleelie-2.jpg": "082cd36b9f47935b9df0704080001135",
"assets/assets/images/projects/daleelie/daleelie-5.jpg": "beb70bc8d9acfe56da6ad37b8e15db78",
"assets/assets/images/projects/losgo/LosGo-9.jpg": "94a2feb99a637a91d58df4f3bcd8cd00",
"assets/assets/images/projects/losgo/LosGo-5.jpg": "223b99b0339843c7d0bbcbcad37a41df",
"assets/assets/images/projects/losgo/LosGo-1.jpg": "77a53de05381c1b635471c794f8a0cdd",
"assets/assets/images/projects/losgo/LosGo-11.jpg": "034ab8d8a5b25aafeed2b97d27af1d00",
"assets/assets/images/projects/losgo/LosGo-8.jpg": "f5f73c6caf5068a0ac4e7fa06c1b3b49",
"assets/assets/images/projects/losgo/LosGo-7.jpg": "073987eaa66abe00d18198a611abe073",
"assets/assets/images/projects/losgo/LosGo-3.jpg": "a070355a3fc7fa778528a864971941ed",
"assets/assets/images/projects/losgo/LosGo-4.jpg": "3ef2fbeda6675ba73256336de8d975db",
"assets/assets/images/projects/losgo/LosGo-10.jpg": "e8d4ba0743514041440513504daa6175",
"assets/assets/images/projects/losgo/LosGo-2.jpg": "c6dd7e3962e91f3bb678c376cf56ea4c",
"assets/assets/images/projects/losgo/LosGo-6.jpg": "aafcb2eaa23201e1ba8d51fb13c78d1c",
"assets/assets/images/projects/SMS/SMS-6.jpg": "6991c837930e438e0b2c230b7f32925c",
"assets/assets/images/projects/SMS/SMS-5.jpg": "689b0bc5af3900db7e85702e1505571d",
"assets/assets/images/projects/SMS/SMS-3.jpg": "8f612efa6194dbc56fbf376ab0a61b89",
"assets/assets/images/projects/SMS/SMS-1.jpg": "1e0005953629c1b9b50c733b0a43f360",
"assets/assets/images/projects/SMS/SMS-4.jpg": "d44120e6ae460a40becf72eb38a88e49",
"assets/assets/images/projects/SMS/SMS-2.jpg": "25b76092af7062338fac5ce69d59bb34",
"assets/assets/images/myPhoto.jpg": "dbd0e52664485ef41307c5a1333e956b",
"assets/fonts/MaterialIcons-Regular.otf": "9ac2ebde0ad0a49d1e875bd29335c8ce",
"assets/NOTICES": "ce26fe160d4fd3dbe1dba3bc7d7a9f1d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "72eb4eeab013455d9b7e80e463dac2e3",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "be7680f6826691746d35a9e5f8f1e7f4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "47d024aaed2d01f1dab2439134b94fee",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin": "bbaa73c5634378e5d3afb6043fbbd619",
"assets/AssetManifest.json": "bd974e187ad67a9dcef2e16d74329b18",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "42d69f616b180fb1c3da83ca26c30cae",
"version.json": "754606db2b8b2c081a5ea16723ff35e8",
"main.dart.js": "e7267dc7a4ffa68e34d0879c8cd952c5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
