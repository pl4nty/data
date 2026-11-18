-- Threat: !InfrastructureShared
-- Name: Cutwail
-- Type: 17

local l_0_0 = {
  "%windir%\\system32\\drivers\\runtime.sys",
  "%windir%\\system32\\drivers\\runtime2.sys",
  "%windir%\\system32\\drivers\\runtime2.sy_",
  "%windir%\\system32\\drivers\\ip6fw.sys",
  "%windir%\\system32\\drivers\\netdtect.sys",
  "%windir%\\system32\\drivers\\secdrv.sys",
  "%windir%\\system32\\drivers\\smtpdrv.sys",
  "%windir%\\system32\\main.sys",
  "%windir%\\system32\\wsys.dll",
  "%windir%\\system32\\WinCtrl32.dll",
  "%windir%\\system32\\WLCtrl32.dll",
  "%windir%\\system32\\WinNt32.dll",
  "%windir%\\system32\\WinNt64.dll",
  "%windir%\\system32\\rs32net.exe",
  "%windir%\\temp\\startdrv.exe",
  "%temp%\\ldrnt.bin",
  "%temp%\\restore.sys",
  "%temp%\\wuauclt.exe"
}
for l_0_1, l_0_2 in ipairs(l_0_0) do
  MpDetection.ScanResource("file://" .. l_0_2)
end
