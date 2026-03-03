# 🔊 Windows Terminal Error Sounds
Add `Fahh` sound trigger to your Windows Terminal (PowerShell) whenever you type an unrecognized command. Perfect for suprising your friends and making errors sessions funny. You can also add your own custom sound.

# 🚀 Quick Start
## 1. Clone the Repo
### PowerShell
```
git clone https://github.com/PrakharG8651/Fahh.git
cd Fahh
```
## 2. Install

To bypass the default Windows script restrictions and set up the sound hook, run:

### PowerShell
```
powershell -ExecutionPolicy Bypass -File .\install.ps1
```
## 3. Activate
Restart Windows Terminal completely. Open a new tab and type a nonsense command (e.g., checkmate) to hear your sound!

# 🛠️ How it Works
The script adds a small code block to your `$PROFILE` (your PowerShell startup script). It hooks into the CommandNotFoundAction event to play the Sound.wav file located in the `assets/` folder.

# File Structure
`assets/Sound.wav` - Your `Fahh` audio file (must be a 16-bit PCM .wav). You can customize it by replacing Sound.wav with your own `Sound.wav` file.

`install.ps1` - The automation script for setup.

`uninstall.ps1` - The cleanup script to revert all changes.

# 🗑️ Uninstallation
Tired of the noise? You can remove the feature instantly without manually editing files:

PowerShell
powershell -ExecutionPolicy Bypass -File .\uninstall.ps1
Note: You must restart the terminal after uninstalling for the sound to stop.

# ⚠️ Troubleshooting
No Sound? Ensure your "System Sounds" are not muted in the Windows Volume Mixer and that you are using a standard .wav file.

Permission Errors: If the script fails, run PowerShell as Administrator once and run:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine

## 🤝 Contributing

This is a simple project, but there is always room for improvement. If you want to contribute, feel free to fork the repo and submit a PR. 

**Planned Improvements:**
* **Randomizer**: Add a feature to pick a random .wav from the assets folder.
* **Volume Control**: Native way to adjust playback volume via script.
* **Cross-Shell Support**: Adding support for CMD or Bash (WSL).

**How to contribute:**
1. Fork the repo.
2. Create your feature branch (`git checkout -b feature/NewSound`).
3. Commit and push your changes.
4. Open a Pull Request.