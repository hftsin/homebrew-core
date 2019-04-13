class Uhd < Formula
  desc "Hardware driver for all USRP devices"
  homepage "https://files.ettus.com/manual/"
  url "https://github.com/EttusResearch/uhd/archive/v3.14.0.0.tar.gz"
  sha256 "612bcc4e857e126c2e1ace98618816209665b20c4136c9e987c67511661715df"
  head "https://github.com/EttusResearch/uhd.git"

  bottle do
    sha256 "019e463662322a2468f01524cda377e75f3071ffe57fff7a08011877a3415a01" => :mojave
    sha256 "0b377e3732cdbf3c60bdccc61d4cf9fe35ef9db8523c8112f635037a40dbaa06" => :high_sierra
    sha256 "0a939217bd4b1d772df4c75c5651b49bb01557102eac56695e6d9bd925df280c" => :sierra
  end

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "boost"
  depends_on "libusb"
  depends_on "python"

  resource "Mako" do
    url "https://files.pythonhosted.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz"
    sha256 "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"
  end

  def install
    xy = Language::Python.major_minor_version "python3"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"

    resource("Mako").stage do
      system "python3", *Language::Python.setup_install_args(libexec/"vendor")
    end

    mkdir "host/build" do
      system "cmake", "..", *std_cmake_args, "-DENABLE_PYTHON3=ON"
      system "make"
      system "make", "test"
      system "make", "install"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uhd_config_info --version")
  end
end
