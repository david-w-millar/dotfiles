# Win Config

I use [BoxStarter][boxstarter] to bootstrap some core tools and utilities.

TODO:
- [ ] Tweak installed apps
- [ ] Swap Escape & Caps Lock
- [ ] Tweak Babun Environment
- [ ] Enable WinRM

## [BoxStarter][boxstarter]

From administrator PowerShell:

```PowerShell
PS C:\> Set-ExecutionPolicy Unrestricted -Force
PS C:\> Enable-PSRemoting -Force
PS C:\> winrm quickconfig
PS C:\> start http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/david-w-millar/dotfiles/develop/win/boxstarter
```

Or just [click here][windot] from a windows box.


See [BoxStarter][boxstarter] for more information.


[boxstarter]: http://boxstarter.org  "BoxStarter"
[windot]: http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/david-w-millar/dotfiles/develop/win/boxstarter
