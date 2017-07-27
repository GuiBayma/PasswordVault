# Install swiftlint if necessary
if ! which swiftlint >/dev/null; then
    brew install swiftlint
fi

# Run Swiftlint
echo "Swiftlint output"
cd project_folder
swiftlint