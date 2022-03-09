echo "----------------------------------------";
echo "⬇️  Uninstalling MVP template";
echo "----------------------------------------";

XCODE_USER_MVP_TEMPLATE_FILES_DIR=~/Library/Developer/Xcode/Templates/File\ Templates/MVP\ Module.xctemplate

if [ -d "${XCODE_USER_MVP_TEMPLATE_FILES_DIR}" ] 
then
  rm -rf "${XCODE_USER_MVP_TEMPLATE_FILES_DIR}"
fi

echo "----------------------------------------";
echo "✅  MVP template uninstalled";
echo "----------------------------------------";