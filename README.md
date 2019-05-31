# The SAP iOS SDK CocoaPods Repo

This repository contains the CocoaPods specifications for frameworks in the SAP Cloud Platform SDK for iOS. Frameworks downloaded here are identical to those available through SAP Service Marketplace, and on the SAP Developer Site.

# Requirements

1. Ruby
2. Cocoapods dependency manager
3. Technical user & password, for [repositories.sap.ondemand.com](https://shipments.pages.repositories.sap.ondemand.com/docs/shipment-sap-client.html#repository-based-shipment-channel-technical-users-management-ui)
4. Apple Xcode IDE

# Download and Installation

## Installing Ruby

Ruby versions 2.0 and above are included by default in macOS releases since at least El Capitan (10.11).  Additional installation techniques are documented [here](https://www.ruby-lang.org/en/documentation/installation/).

Homebrew is a commonly used package manager on macOS.  Installing Ruby using Homebrew is easy:

```shell
brew install ruby
```

## Installing Cocoapods

Cocoapods is a dependency manager for Swift and Objective-C Cocoa projects.

Documentation is available at [cocoapods.org](https://cocoapods.org/).
Installation is a Ruby `gem install` command; updates are done with `gem` as well.

```shell
$ sudo gem install cocoapods
```

## Installing Apple Xcode IDE

Xcode may be installed via the Mac App Store, or, specific versions may be downloaded at [developer.apple.com/download](https://developer.apple.com/download/).

The current version of Xcode which is supported by the latest SAP binaries is Xcode 10.2.x.

# Configuration

## Obtaining Technical user & password

The SDK binaries are hosted in SAP's Internet-facing repository, which requires authenticated access. Before running `pod update`, you must visit the [Technical Users' UI Home Page](https://repositories.sap.ondemand.com/ui) to obtain a technical username/password.  

 > SAP Customers & Partners:  use your **S-User** credentials

 > SAP Employees: use your **SAP email username & GLOBAL** credentials

<img src="https://github.com/SAP/cloud-sdk-ios-podspecs/blob/resources/gif/GetCredentialsFromRepo.gif?raw=true" width=600>

## Installing credential

Open, or create a new file at `~/.netrc`.

Add an entry which includes the username password credential pair, as follows:

```
machine repositories.sap.ondemand.com 
    login sap-xxxxxx 
    password xxxxxxxxxxxxxxxxxx
```

The **netrc** credential technique is a stand **cURL** API.  For complete documentation, see [gnu.org](https://www.gnu.org/software/inetutils/manual/html_node/The-_002enetrc-file.html).

# Usage

## Supported SAP Binary Dependencies (pods)

Specs for the following pods are registered in the repository source:  `https://github.com/SAP/cloud-sdk-ios-podspecs`.

 - `SAPFoundation`
 - `SAPCommon`
 - `SAPFiori`
 - `SAPFioriFlows`
 - `SAPOData`
 - `SAPOfflineOData`

 ### Example Podfile with SAP Dependencies

 ```ruby
source 'https://github.com/SAP/cloud-sdk-ios-podspecs'

platform :ios, '11.0'
use_frameworks!

target 'MyApp' do
    pod 'SAPCommon', '~> 3.1.300'
    pod 'SAPFoundation', '~> 3.1.300'
    pod 'SAPFiori', '~> 3.1.300'
    pod 'SAPFioriFlows', '~> 3.1.300'
    pod 'SAPOfflineOData', '~> 3.1.300'
  end
```

## Podfile

The dependency manifest file for a Cocoapods-managed project is a [**Podfile**](https://guides.cocoapods.org/using/the-podfile.html).  

The Podfile is a specification that describes the dependencies of the targets of one or more Xcode projects. The file should simply be named `Podfile`, and should be stored in the same directory as the associated `xcodeproj` file(s).

### General Dependencies

Each dependency supported by Cocoapods is called a **Pod**.  To add a pod as a dependency of a Target, write the entry into the `Podfile`.

```ruby
platform :ios, '11.0'
use_frameworks!

target 'MyApp' do
  pod 'SwiftConfettiView'
end
```
### Specifying Dependency Versions

Each Pod should support [semanitic versioning](https://guides.cocoapods.org/using/the-podfile.html#specifying-pod-versions), such that developers may specify a particular version of a dependency, a minimum, maximum, or range.  For pods whose source is available, the version may also be a particular git branch or commit.

> SAP framework dependencies are distributed as binaries, and thus support only major, minor, patch versioning.  For the **SAP Cloud Platform SDK for iOS**, these equate to:  major = major version, minor = service pack ("SP"), patch = patch level ("PL").  `3.0 SP03 PL01 == 3.3.100`

### Specifying Dependency Source

Cocoapods maintains a central repository of 'specifications' for each pod (a [**podspec**](https://guides.cocoapods.org/making/specs-and-specs-repo.html)) which is publicly published.  When parsing the Podfile, cocoapods checks the central repository by default, for specs associated with each `pod` listed for the Target.

Since SAP's binaries require authentication for access, their specifications cannot be published to the central repository.  Therefore, this github repo serves as a secondary ***spec repository*** source.

To add pods from the SAP spec repository to your Podfile, you should list this source, either in the header of the Podfile, or in-line with the associated pod(s).

> If you are adding the `/SAP/cloud-sdk-ios-podspecs` source to the Podfile header, cocoapods will not be able to locate pods documented in the central repository, unless you also explicitly add the central repository as a source. 
> ``` ruby
> source 'https://github.com/CocoaPods/Specs.git'
> source 'https://github.com/SAP/cloud-sdk-ios-podspecs'
> ```
> Alternatively, list the source in-line:
> ```ruby
> target 'MyApp' do
>     pod 'SAPCommon', '~> 3.1.300', :source => 'https://github.com/SAP/cloud-sdk-ios-podspecs'
>     pod 'SwiftConfettiView'
> ```

## Installing and Updating Dependencies

Cocoapods provides the `install` and `update` commands for importing dependencies.  Either will pull new dependencies; `install` does *not* check the spec repository for new versions, while `update` checks the remote spec repositories for new podspec files, before downloading dependencies.

For additional details on using cocoapods, see [the guides](https://guides.cocoapods.org/using/pod-install-vs-update.html).

# Limitations

**This service is not available for Trial versions of the SDK.**

 > Quoting the SAP support site, *“you can download the SAP products that are associated with your S-user ID. While every visitor can browse the list of software products without any special permissions, downloading files requires the Software Download authorization; to request it, contact a user administrator in your company.”* This restriction also applies to the cloud shipment channel.

# Known Issues

 - SAPML framework is not currently supported as a managed dependency, due to a naming conflict in a dependent framework.

# How to obtain support

For an issue related to the contents of this repository, please [file an Issue](https://github.com/SAP/cloud-sdk-ios-specs/issues).

For issues related to any of the referenced resources and binaries, please file a support ticket to SAP through the regular channels.

# Contributing

If you wish to make a contribution to the repository, please [submit a Pull Request](https://github.com/SAP/cloud-sdk-ios-specs/pulls).  It will be reviewed by the maintainers, however, we cannot commit to merging all contributions.

# To-Do (upcoming changes)

 - Support for Carthage binary distribution
 - Support for Cocoapods, for SAPML framemowrk

# License

Copyright (c) 2009-2019 SAP SE or an SAP affiliate company. See [LICENSE](https://raw.githubusercontent.com/SAP/cloud-sdk-ios-specs/master/LICENSE?token=AAC4EPBF7USSVNCUXM2XJCC47LRT4) file.

Access to this service requires licensed access to SAP Cloud Platform SDK for iOS, e.g. by means of subscribing to SAP Cloud Platform Mobile Services, and a valid S-user for external staff. 