-- Threat: !InfrastructureShared
-- Name: Cutwail
-- Type: 15

if string.match(Remediation.Threat.Name, "Cutwail") then
  local l_0_0 = {
    "%windir%\\0_exception.nls",
    "%windir%\\1_exception.nls",
    "%windir%\\2_exception.nls",
    "%windir%\\3_exception.nls",
    "%windir%\\4_exception.nls",
    "%windir%\\5_exception.nls",
    "%windir%\\6_exception.nls",
    "%windir%\\7_exception.nls",
    "%windir%\\8_exception.nls",
    "%windir%\\9_exception.nls"
  }
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    local l_0_3 = MpCommon.ExpandEnvironmentVariables(l_0_2)
    if l_0_3 then
      sysio.DeleteFile(l_0_3)
    end
  end
  local l_0_4 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Control\\SafeBoot\\Network")
  if l_0_4 then
    sysio.DeleteRegKey(l_0_4, "runtime2.sys")
  end
  local l_0_5 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Control\\SafeBoot\\Minimal")
  if l_0_5 then
    sysio.DeleteRegKey(l_0_5, "runtime2.sys")
  end
  local l_0_6 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsft\\Windows NT\\CurrentVersion\\Winlogon\\Notify")
  if l_0_6 then
    sysio.DeleteRegKey(l_0_6, "WLCtrl32")
  end
  local l_0_7 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  if l_0_7 then
    sysio.DeleteRegValue(l_0_7, "startdrv")
  end
  if Remediation.Threat.Active then
    Remediation.SetRebootRequired()
  end
end
