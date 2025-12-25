'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "e2b9103aaafaf8ed9f90576c9d9a1341",
"index.html": "f18f9fbd99b909c85e5d30cc0edc4b1f",
"/": "f18f9fbd99b909c85e5d30cc0edc4b1f",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "2a6020eb46235ed458a3fb132ec6bd18",
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
"assets/fonts/MaterialIcons-Regular.otf": "4fc81fe35942182ab42f607ef991a629",
"assets/NOTICES": "bed387ff3be91f8432a1d5dff2d20bcd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "af29091d54f44ecb5b27f19bd60a4b92",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "a46afa7ff46ad5fbdb6d908ccb82a6d0",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "f904758baa90eb7f124f6e271bb00277",
"assets/FontManifest.json": "c75f7af11fb9919e042ad2ee704db319",
"assets/AssetManifest.bin": "c004aa8681d0a47b8e0aadfffcb7a6e1",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "09ffc376a6ab1ec18e8b116f136fb28c",
"version.json": "9b818ca9511483c901bed1545384376c",
"main.dart.js": "0625f6d01baca6cd165ad9baa4d12dcd"};
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
