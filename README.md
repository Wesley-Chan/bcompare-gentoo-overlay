# What This Is

This'll help you install Beyond Compare on your Gentoo, dawg.

# How to Use

## Set Up Your Own Portage Overlay

This is a jargon which means installing software that official Gentoo repository is not providing. STFW to find out how to do it in two minutes.

## Add It to Your Overlay

Clone this repo and copy the folder `dev-util` to your local portage overlay.

## Install Beyond Compare

    emerge bcompare

# FAQ

**Am I getting Beyond Compare for free?**  
Get your ass to the [official website](https://www.scootersoftware.com) to buy a license. I ain't cracking anything.

**I found a new version of Beyond Compare! I'm so hyped! What do I do?**  
Just change the filename according to the new version number. Then

    ebuild <new ebuild filename> manifest
    emerge -u bcompare
