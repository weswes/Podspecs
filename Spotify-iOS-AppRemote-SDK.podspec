Pod::Spec.new do |s|
  s.name = 'Spotify-iOS-AppRemote-SDK'
  s.module_name = 'Spotify'
  s.summary = 'Spotify iOS App Remote SDK.'
  s.version = '1.0.0'
  s.source = { :http => 'https://github.com/spotify/ios-app-remote-sdk/archive/v1.0.0.zip' }

  s.license = { :type => 'Proprietary', :text => 'https://developer.spotify.com/developer-terms-of-use/' }
  s.author = { 'Spotify' => 'https://developer.spotify.com/' }
  s.homepage = 'https://github.com/spotify/ios-app-remote-sdk'

  s.platform = :ios
  s.ios.deployment_target = '7.1'

  s.requires_arc = true
  s.framework = 'Foundation'

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }

  s.user_target_xcconfig = {
    'LIBRARY_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Spotify-iOS-SDK"'
  }

  s.preserve_paths = 'ios-app-remote-sdk-1.0.0/SpotifyAppRemote.framework/SpotifyAppRemote'
  s.prepare_command = "touch Empty.m && cp ios-app-remote-sdk-1.0.0/SpotifyAppRemote.framework/SpotifyAppRemote libSpotifyAppRemote.a && cp ios-app-remote-sdk-1.0.0/SpotifyAppRemote.framework/Headers/* ./ && sed -i '' 's@<SpotifyAppRemote/@<Spotify/@g' *.h"

  s.source_files = 'Empty.m', '*.h'
  s.public_header_files = '*.h'

  s.subspec 'AppRemote' do |ss|
    ss.vendored_libraries = 'libSpotifyAppRemote.a'
  end

  s.default_subspecs = 'AppRemote'
end
