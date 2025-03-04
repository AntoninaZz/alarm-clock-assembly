# Digital Clock Alarm

## Overview
This project is a digital clock alarm application running in a text-based video mode (80x25). The clock is displayed using ASCII characters and pseudographics. Users can set an alarm time, which triggers a sound and color change when activated. The program logs all events in a text file.

## Features
- Displays current time using ASCII characters.
- Allows users to set an alarm time.
- Provides real-time feedback for user input.
- Logs events such as program start, key presses, alarm setting, and alarm activation.
- Changes display color and plays a sound when the alarm triggers.

## Controls
- `s` - Set the alarm time.
- `Z` - Exit the program.

## Event Logging
The program records events in `journal.txt` in the format:
```
___________________________________
Start.........................14:24
PressKey_s....................14:25
SetAlarm......................14:26
AlarmRing.....................14:30
End...........................14:31
```

## Technologies Used
- Assembly language (TASM)
- DOS interrupts for display and input handling
- File I/O operations for event logging

## How It Works
1. The program starts by displaying a digital clock with the current system time.
2. Users can choose to set an alarm by entering time values sequentially.
3. If an incorrect input is detected, an error message is shown.
4. When the alarm time matches the system time, the display turns red and a sound is played.
5. The program continuously runs until the user exits with `Z`.

## Running the Program
Compile and run using TASM in a DOS-compatible environment. Ensure the `journal.txt` file exists in the same directory as exe-file.
