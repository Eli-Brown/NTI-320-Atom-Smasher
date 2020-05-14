Name:     pello							# Name of the SPEC file 
Version:	0.1.1							# Verison or revison of file 
Release:  1%{?dist}						
Summary:   Hello World example implemented in python


License:	GPLv3+
URL:									    # source line is used to provide the source filename to RPM package
Source0:								  # To give the name where the packaged software's sources can be found and locationsof the source file as it exists in the SOURCES subdirectory.

BuildRequires:	python		# packages that the software you are packaging requires
Requires:	      python
Requires:     	bash

BuildArch:      noarch


%description								#  It is used to provide a more detailed description of the packaged software
The long-tail description for our Hello World Example implemented in Python.

%prep									  # cleans up old build trees and then uncompresses and extracts the files from the original source
%setup -q								# the focus is entirely on directing RPM through the process of preparing the software for building

%build		
python -m compileall %{name}.py						#  responsible for performing the build,
%configure								                # configuring the packages in the build
make %{?_smp_mflags}					        		#  running the compile code and builds the software

%install							            	# The application is built with make and has an ``install'' target to build file
rm -rf $RPM_BUILD_ROOT							# removing the base and install the newly complied code
%make_install
mkdir -p %{buildroot}/%{_bindir}
mkdir -p %{buildroot}/usr/lib/%{name}

cat > %{buildroot}/%{_bindir}/%{name} <<-EOF
#!/bin/bash
/usr/bin/python /usr/lib/%{name}/%{name}.pyc
EOF

chmod 0755 %{buildroot}/%{_bindir}/%{name}

install -m 0644 %{name}.py* %{buildroot}/usr/lib/%{name}/




%files									# it contains a list of the files that are part of the package
%doc

%license LICENSE
%dir /usr/lib/%{name}/
%{_bindir}/%{name}
/usr/lib/%{name}/%{name}.py*

%changelog
* Tue May 31 2016 Adam Miller <maxamillion@fedoraproject.org> - 0.1.1-1
  - First pello package

%changelog
* Tue May 31 2016 Adam Miller <maxamillion@fedoraproject.org>
-
