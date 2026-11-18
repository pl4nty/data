-- Threat: !InfrastructureShared
-- Name: Sirefef
-- Type: 17

MpDetection.ScanResource("folder://%windir%\\assembly\\temp")
MpDetection.ScanResource("file://%windir%\\assembly\\GAC\\desktop.ini")
MpDetection.ScanResource("file://%windir%\\assembly\\GAC_32\\desktop.ini")
MpDetection.ScanResource("file://%windir%\\assembly\\GAC_64\\desktop.ini")
MpDetection.ScanResource("file://%windir%\\assembly\\GAC_MSIL\\desktop.ini")
local l_0_0 = sysio.ExpandFilePath("%temp%\\msimg32.dll", true)
if l_0_0 then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2 then
      MpDetection.ScanResource("file://" .. l_0_2)
    end
  end
end
