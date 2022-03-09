echo "----------------------------------------";
echo "⬇️  Updating gem";
echo "----------------------------------------";

sudo gem update --system

echo "----------------------------------------";
echo "⬇️  Installing brew";
echo "----------------------------------------";

/usr/bin/ruby \
-e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
< /dev/null

echo "----------------------------------------";
echo "⬇️  Installing SwiftLint";
echo "----------------------------------------";

brew install swiftlint