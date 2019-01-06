set -euxo pipefail

main() {
    case $TARGET in
        arm*v7r-none-eabi*)
            cd quickstart

            cargo build
            cargo build --examples
            cargo build --examples --release
            cargo build --release
            ;;
        *)
            cd rt

            ./check-blobs.sh
            ;;
    esac
}

main
