# SpotifySearch
-------------------------------------
Technical explanations:
In SpotifySearch  i used VIP architecture
used below dependencies :
alamofire for networking
reachablity swift for checking network status (for SpotifyLogin calls)
kingfisher for downloading images
spotifyLogin for login process and getting access token
rxSwift for throttling
and Bagel for network monitoring (that  could be removed)

for more information :
there's some providers as wrappers to manage tokening, Keychain and etc.
a WebService as alamofire wrapper and codable for mapping

some namespaces for classifying : Global and etc.
also i considered:
token expiration , server Errors and no connection states.
most of swift lint principles
clean code solid principles

and i used XCTest framework for Clean-Swift unit-testing and wrote some tests for Search scene.
-------------------------------------------
