require "language/node"

class BalenaCli < Formula
  desc "The official balena CLI tool"
  homepage "https://www.balena.io/docs/reference/cli/"
  # Frequent upstream releases, do not update more than once a week
  url "https://registry.npmjs.org/balena-cli/-/balena-cli-11.20.2.tgz"
  sha256 "a78f84c3d343f274d3e51fed1f06656e7cfe557dbe22f9af78871c94f6c1040b"

  bottle do
    sha256 "ab94fcaa8ee83550f321d78062214a9e7ca3f44f0ca4d41af5b6b264076ddc51" => :catalina
    sha256 "db2cfa5b3c8769e2c71fa70307f00d63dd5f9bdd8cb725a8585411faae94df80" => :mojave
    sha256 "acb18539f13ee6117c4845b00796af3baef0179d4e508331699cec199f0649c8" => :high_sierra
  end

  depends_on "node"

  # fixes node 13 compatibility
  patch :DATA

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/balena login --credentials --email johndoe@gmail.com --password secret 2>/dev/null", 1)
    assert_match "Logging in to balena-cloud.com", output
  end
end

__END__
diff --git a/npm-shrinkwrap.json b/npm-shrinkwrap.json
index 2101ae4..9d4d743 100644
--- a/npm-shrinkwrap.json
+++ b/npm-shrinkwrap.json
@@ -5034,9 +5034,9 @@
       }
     },
     "ext2fs": {
-      "version": "1.0.29",
-      "resolved": "https://registry.npmjs.org/ext2fs/-/ext2fs-1.0.29.tgz",
-      "integrity": "sha512-AoHwqSNx8SLZizLCMs+etrvdethI+jzak5yVmHACV+G0ziiLd19E3OQpC+SMmGOL1V+uRz3om7VxT5itfThYfQ==",
+      "version": "1.0.31",
+      "resolved": "https://registry.npmjs.org/ext2fs/-/ext2fs-1.0.31.tgz",
+      "integrity": "sha512-bfaggH7juFJNxXoY2nPShr8CSFbijKRsPYOwmSSms88I5n1X7+qsVqnMLLiq6VMI9MxHIFvqGfB+cwum0U1uPQ==",
       "requires": {
         "async": "^2.6.1",
         "bindings": "^1.3.0",
@@ -8290,9 +8290,9 @@
       }
     },
     "lzma-native": {
-      "version": "4.0.5",
-      "resolved": "https://registry.npmjs.org/lzma-native/-/lzma-native-4.0.5.tgz",
-      "integrity": "sha512-pmLMsHQlXQAikqGqapzUOtACPW/gEtt9xhkcrkJnsjWn+I1g7OIbrV2SugL8jinkBCD+QxqAze51VtRsECDcxQ==",
+      "version": "4.0.6",
+      "resolved": "https://registry.npmjs.org/lzma-native/-/lzma-native-4.0.6.tgz",
+      "integrity": "sha512-1kiSs/KAcAuh9vyyd00ATXZFfrg6W8UCBqH1RKlWg/tBP5aQez6HYOY+SihmsZfpy0RVDioW5SLI76dZ3Mq5Rw==",
       "requires": {
         "nan": "^2.14.0",
         "node-pre-gyp": "^0.11.0",
@@ -12797,7 +12797,7 @@
         "@types/node": "^6.0.112",
         "@types/usb": "^1.5.1",
         "debug": "^3.1.0",
-        "usb": "github:balena-io/node-usb#v1.3.12"
+        "usb": "1.3.13"
       },
       "dependencies": {
         "@types/node": {
@@ -17613,8 +17613,9 @@
       "integrity": "sha1-FQWgOiiaSMvXpDTvuu7FBV9WM6k="
     },
     "usb": {
-      "version": "github:balena-io/node-usb#1fb1bb01d04281432083b96801c6be6d528bd213",
-      "from": "github:balena-io/node-usb#v1.3.12",
+      "version": "1.3.13",
+      "resolved": "https://registry.npmjs.org/@balena.io/usb/-/usb-1.3.13.tgz",
+      "integrity": "sha512-qG2nGJduDtmgElK6KhcJ/u9M67FlgTSAF8IkcC6CZOTitSLRMh1OqeXtI5B3q7KyFH5773qZYj2g1jlXhpL1dQ==",
       "requires": {
         "nan": "2.13.2",
         "node-pre-gyp": "^0.11.0"
