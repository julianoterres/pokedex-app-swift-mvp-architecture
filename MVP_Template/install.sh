echo "----------------------------------------";
echo "⬇️  Installing MVP template";
echo "----------------------------------------";

XCODE_USER_TEMPLATES_DIR=~/Library/Developer/Xcode/Templates/
XCODE_USER_TEMPLATES_FILES_DIR=~/Library/Developer/Xcode/Templates/File\ Templates
TEMPLATE_FILES_MVP_DIR=MVP\ Module.xctemplate

if [ ! -d "${XCODE_USER_TEMPLATES_DIR}" ] 
then
  mkdir  "${XCODE_USER_TEMPLATES_DIR}"
fi

if [ ! -d "${XCODE_USER_TEMPLATES_FILES_DIR}" ] 
then
  mkdir  "${XCODE_USER_TEMPLATES_FILES_DIR}"
fi

cp -R "${TEMPLATE_FILES_MVP_DIR}" "${XCODE_USER_TEMPLATES_FILES_DIR}"

echo "----------------------------------------";
echo "✅  MVP template installed";
echo "----------------------------------------";