set shell := ["powershell.exe", "-c"]

# scoop install dotnet10-sdk dotnet9-sdk just git;
# git submodule add "https://github.com/goatcorp/FFXIVQuickLauncher" ./submodules/FFXIVQuickLauncher;

default:
    just --list;

[working-directory: "./submodules/FFXIVQuickLauncher/src"]
build:
    -& "$(scoop prefix dotnet10-sdk)\\dotnet.exe" build -c Debug --disable-build-servers;
    echo "Executable should be at: $(Resolve-Path .\\XIVLauncher\\bin\\Debug)"

setup:
    git submodule update --init --recursive

clean:
    git clean -fdx;
    git submodule foreach --recursive 'git clean -fdx'

[working-directory: "./submodules/FFXIVQuickLauncher/src"]
run:
    & "$(scoop prefix dotnet9-sdk)\\dotnet.exe" ".\\XIVLauncher\\bin\\Debug\\XIVLauncher.dll"

