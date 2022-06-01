Package: $name-$version
Version: 1.0.0
Section: base
Priority: optional
Architecture: all
Depends: build-essential, checkinstall, libreadline-gplv2-dev, libncursesw5-dev, libssl-dev, libsqlite3-dev, tk-dev, libgdbm-dev, libc6-dev, libbz2-dev
Maintainer: Your Name <you@email.com>
Environment:
 PATH=/bfx/bin/$name/$version/bin:\$PATH
 LD_LIBRARY_PATH=/bfx/bin/$name/$version/lib:\${LD_LIBRARY_PATH:=}
Description: $name

