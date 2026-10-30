cask "pdf2docx" do
  version "0.1.1"
  sha256 :no_check

  url "https://github.com/SecurityRonin/pdf2docx/releases/download/v#{version}/PDF2DOCX-#{version}-aarch64-apple-darwin.dmg",
      verified: "github.com/SecurityRonin/pdf2docx/"
  name "PDF to DOCX"
  desc "Convert PDF into a DOCX with real Word structure"
  homepage "https://securityronin.github.io/pdf2docx/"

  app "PDF to DOCX.app"
end
