---
external help file: HP.Displays.dll-Help.xml
Module Name: HP.Displays
online version: https://developers.hp.com/hp-client-management/doc/set-hpdisplay
schema: 2.0.0
---

# Set-HPDisplay

## SYNOPSIS
Sets features supported on connected displays

## SYNTAX

```
Set-HPDisplay [[-SerialNumber] <String[]>] [[-Brightness] <Int32>] [[-CurrentResolution] <String>]
 [[-Frequency] <Int32>] [[-Contrast] <Int32>] [[-ActiveInput] <String>] [[-AutoInputEnabled] <Boolean>]
 [[-PowerManagement] <String>] [[-MuteSpeaker] <Boolean>] [[-BuiltInAudio] <String>] [[-USBCPort] <String>]
 [[-BlackStretch] <String>] [[-ColorPreset] <String>] [[-SpeakerVolume] <Int32>]
 [[-RestrictFileXfer] <Boolean>] [-MaintainInputUntilUSBDisconnect <String>]
 [-SinglePowerOnMessage <String>] [[-Language] <String>] [[-SystemVolume] <Int32>]
 [[-ResponseTime] <String>] [[-AutoSleepMode] <String>] [[-VirtualMultipleDisplaysConfiguration] <String>]
 [[-PresenceDetection] <String>] [[-EthernetPort] <String>] [[-USBHub] <String>] [[-AudioMenu] <String>]
 [[-Speakers] <String>] [[-WebCam] <String>] [[-Microphone] <String>] [[-DeviceBridgeFileTransfer] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
This command sets features supported on connected displays.

## EXAMPLES

### Example 1
```powershell
PS C:\> Set-HPDisplay -Contrast 70 -ActiveInput DigitalDVI2
```

## PARAMETERS

### -AudioMenu
Allows the IT administrator to disable (lock) the audio menu. 
Valid values are Disable and Enable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Disable, Enable

Required: False
Position: 25
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ActiveInput
Specifies the active input to set to the display.
Valid values are: VGA1, VGA2, DigitalDVI1, DigitalDVI2, CompositeVideo1, CompositeVideo2, SVideo1, SVideo2, Tuner1, Tuner2, Tuner3, Component1, Component2, Component3, HDMI1, HDMI2, DP1, DP2, USBCVideo1, USBCVideo2, USBCVideo1Thunderbolt4, USBCVideo2Thunderbolt4

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: VGA1, VGA2, DigitalDVI1, DigitalDVI2, CompositeVideo1, CompositeVideo2, SVideo1, SVideo2, Tuner1, Tuner2, Tuner3, Component1, Component2, Component3, HDMI1, HDMI2, DP1, DP2, USBCVideo1, USBCVideo2, USBCVideo1Thunderbolt4, USBCVideo2Thunderbolt4

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AutoInputEnabled
If set to false, auto input switch value will be set to 'Off'.
If set to true, auto input switch value will be set to 'On'.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AutoSleepMode
Specifies the value of the auto-sleep mode to set to the display. 
Valid values are: Off, On

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Off, On

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BlackStretch
Specifies the black stretch value to set to the display.
Valid values are: Off, Low, Medium, High

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Off, Low, Medium, High

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Brightness
Specifies the brightness to set to the display.
Valid values are between 0 and 100.
If a decimal value is specified, it will be rounded to the nearest integer.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BuiltInAudio
Specifies the built-in audio preset to set to the display.
Valid values are: Music, Movie, Voice

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Music, Movie, Voice

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorPreset
Specifies the color preset to set to the display.
Valid values are: UserCalib1,UserCalib2,UserCalib3,UserCalib4,UserCalib5,UserCalib6,UserCalib7,UserCalib8,UserCalib9,UserCalib10,UserCalib11,UserCalib12,UserCalib13,UserCalib14,UserCalib15,UserCalib16,DesignforprintsRGBD50,DesignforwebsRGBD65,PhotographyP3D65,HDvideoBT709,sRGBD50,BT709,BT709D65,BT601,P3D65,AdobeRGBD50,AdobeRGBD65,BT2020,sRGBD65,EPD,DICOM,FullNative,SDRCustom1,SDRCustom2,SDRCustom3,SDRCustom4,SDRCustom5,Warm,Cool,Neutral,Standard,Gaming,Cinema,Multimedia,Photo, HPEnhance,CustomRGB,RetroGamingMode,ColorMatch,PQHDR10,HLG,SDRLowBlueLight,ReadingMode,Vivid,Movie,Night,DisplayP3,GameRemasterMode,ECO,FPS,RPG,RTS,ColorPresetsRGB,ColorPresetPanelNative,ColorPresetCinema,ColorPresetWarm,ColorPresetStandardNeutral,ColorPresetCool,ColorPresetGaming,ColorPresetVivid,ColorPresetCustomColor,ColorPresetHPEnhancePlus,ColorPresetLowBlueLight,Reading,TrNight,TrDicom,TrDicom0,TrDicom2,Text,Custom,MovieorCinema,LegacyPhoto,LegacyGaming,LegacyHPEnhancePlus,LegacyLowBlueLight,LegacyReading,LegacyNight,LegacyTechnicolor,LegacyMultimedia,LegacyWarm,LegacyNeutralorStandard,LegacyCool,Full,sRGB,Rec709BT709,AdobeRGB,Rec601,DCIP3,Custom1,Custom2,Custom3,Custom4,Custom5,Custom6,Custom7,DCIM,Custom1,Custom2,Custom3,Custom4,Custom5,Custom6,Custom7,DCIM

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: UserCalib1, UserCalib2, UserCalib3, UserCalib4, UserCalib5, UserCalib6, UserCalib7, UserCalib8, UserCalib9, UserCalib10, UserCalib11, UserCalib12, UserCalib13, UserCalib14, UserCalib15, UserCalib16, DesignforprintsRGBD50, DesignforwebsRGBD65, PhotographyP3D65, HDvideoBT709, sRGBD50, BT709, BT709D65, BT601, P3D65, AdobeRGBD50, AdobeRGBD65, BT2020, sRGBD65, EPD, DICOM, FullNative, SDRCustom1, SDRCustom2, SDRCustom3, SDRCustom4, SDRCustom5, Warm, Cool, Neutral, Standard, Gaming, Cinema, Multimedia, Photo, HPEnhance, CustomRGB, RetroGamingMode, ColorMatch, PQHDR10, HLG, SDRLowBlueLight, ReadingMode, Vivid, Movie, Night, DisplayP3, GameRemasterMode, ECO, FPS, RPG, RTS, ColorPresetsRGB, ColorPresetPanelNative, ColorPresetCinema, ColorPresetWarm, ColorPresetStandardNeutral, ColorPresetCool, ColorPresetGaming, ColorPresetVivid, ColorPresetCustomColor, ColorPresetHPEnhancePlus, ColorPresetLowBlueLight, Reading, TrNight, TrDicom, TrDicom0, TrDicom2, Text, Custom, MovieorCinema, LegacyPhoto, LegacyGaming, LegacyHPEnhancePlus, LegacyLowBlueLight, LegacyReading, LegacyNight, LegacyTechnicolor, LegacyMultimedia, LegacyWarm, LegacyNeutralorStandard, LegacyCool, Full, sRGB, Rec709BT709, AdobeRGB, Rec601, DCIP3, Custom1, Custom2, Custom3, Custom4, Custom5, Custom6, Custom7, DCIM

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Contrast
Specifies the contrast to set to the display.
Valid values are between 0 and 100.
If a decimal value is specified, it will be rounded to the nearest integer.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CurrentResolution
Specifies the resolution to set to the display.
Format of string 1234x1234 where two integers are separated by 'x' and the first integer is the width and the second integer is the height.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DeviceBridgeFileTransfer
Allows the IT administrator to disable (lock) the device bridge file transfer function. 
Valid values are Disable and Enable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Disable, Enable

Required: False
Position: 29
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EthernetPort
Allows the IT administrator to disable (lock) the ethernet port menu. 
Valid values are Disable and Enable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Disable, Enable

Required: False
Position: 23
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Frequency
Specifies the frequency in Hz to set the display.
If a decimal value is specified, it will be rounded to the nearest integer.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Language
Specifies the language to set to the display. 
Valid values are: ChineseTraditional, English, French, German, Italian, Japanese, Korean, PortuguesePortugal, Russian, Spanish, Swedish, Turkish, ChineseSimplified, PortugueseBrazil, Arabic, Bulgarian, Croatian, Czech, Danish, Dutch, Estonian, Finnish, Greek, Hebrew, Hindi, Hungarian, Latvian, Lituanian, Norwegian, Polish, Romanian, Serbian, Slovak, Slovenian, Thai, Ukrainian, Vietnamese

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: ChineseTraditional, English, French, German, Italian, Japanese, Korean, PortuguesePortugal, Russian, Spanish, Swedish, Turkish, ChineseSimplified, PortugueseBrazil, Arabic, Bulgarian, Croatian, Czech, Danish, Dutch, Estonian, Finnish, Greek, Hebrew, Hindi, Hungarian, Latvian, Lituanian, Norwegian, Polish, Romanian, Serbian, Slovak, Slovenian, Thai, Ukrainian, Vietnamese

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Microphone
Allows the IT administrator to disable (lock) the microphone function.
Valid values are Disable and Enable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Disable, Enable

Required: False
Position: 28
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MuteSpeaker
If set to false, speaker mute value will be set to 'UnMute'.
If set to true, speaker mute value will be set to 'Mute'.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PowerManagement
Specifies the power management value to set to the display.
Valid values are: PowerSaverMode, PerformanceMode

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: PowerSaverMode, PerformanceMode

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PresenceDetection
Allows the IT administrator to disable (lock) presence detection menu.
Valid values are Disable and Enable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Disable, Enable

Required: False
Position: 22
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResponseTime
Specifes the response time value to set to the display. 
Valid values are: Off, Level1, Level2, Level3, Level4, Level5, Level6

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Off, Level1, Level2, Level3, Level4, Level5, Level6

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RestrictFileXfer
If set to false, the display will not restrict file transfer.
If set to true, the display will restrict file transfer.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SerialNumber
Specifies the serial number(s) of the display(s) to apply changes to.
If not specified, all connected displays will be updated.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Speakers
Allows the IT adminstrator to disable (lock) speaker function.
Valid values are Disable and Enable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Disable, Enable

Required: False
Position: 26
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpeakerVolume
Specifies the volume level to set to the display's speaker.
Valid values are between 0 and 100.
If a decimal value is specified, it will be rounded to the nearest integer. If connected via USBC, SpeakerVolume will follow SystemVolume despite value specified by SpeakerVolume parameter.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SystemVolume
Specifies the volume level to set to the system. Display volume is synced with the host when connected via USB. 
Valid values are between 0 and 100.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -USBHub
Allows the IT administrator to disable (lock) the USB Hub.
Valid values are Disable and Enable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Disable, Enable

Required: False
Position: 24
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -USBCPort
Specifies the USB-C port to set to the display.
Valid values are: USBCVideoUSB20, USBCVideoUSB30, USBCVideoUSB32, USB3840216060HzUSB20, USB3840216030HzUSB30, USB2560144060HzUSB20, USB2560144060HzUSB30, USB34401440100HzUSB20, USB3440144060HzUSB30, USB1920120060HzUSB20, USB1920120060HzUSB30, USB5120216060HzUSB20, USB5120216060HzUSB30, USB3840216060HzUSB30, USBCAUTO.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: USBCVideoUSB20, USBCVideoUSB30, USBCVideoUSB32, USB3840216060HzUSB20, USB3840216030HzUSB30, USB2560144060HzUSB20, USB2560144060HzUSB30, USB34401440100HzUSB20, USB3440144060HzUSB30, USB1920120060HzUSB20, USB1920120060HzUSB30, USB5120216060HzUSB20, USB5120216060HzUSB30, USB3840216060HzUSB30, USBCAUTO

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VirtualMultipleDisplaysConfiguration
Specifies the split screen value to set to the display. 
Valid values are: SplitScreenOff, PbP, DeviceBridge, VirtualDualDisplay, PiP, PbP1_4, PbP3_4, VMD1, VDD1_4, VDD3_4, VMD2, ToggleSplitScreenOnorOff, ToggleBetweenWSplitScreenOptions, SwapLeftorRightSplitScreenInputs, ResetSplitScreenMenu, PbP1_3, PbP3_1

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: SplitScreenOff, PbP, DeviceBridge, VirtualDualDisplay, PiP, PbP1_4, PbP3_4, VMD1, VDD1_4, VDD3_4, VMD2, ToggleSplitScreenOnorOff, ToggleBetweenWSplitScreenOptions, SwapLeftorRightSplitScreenInputs, ResetSplitScreenMenu, PbP1_3, PbP3_1

Required: False
Position: 21
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WebCam
Allows the IT administrator to disable (lock) the webcam function.
Valid values are Disable and Enable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Disable, Enable

Required: False
Position: 27
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaintainInputUntilUSBDisconnect
Specifies the switch USB value to set to the display. 
Valid values are: Default, Off, On

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinglePowerOnMessage
Specifies the value of the single power on message to set to the display. 
Valid values are: Off, On

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
