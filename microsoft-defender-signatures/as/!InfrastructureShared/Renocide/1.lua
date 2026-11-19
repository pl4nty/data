-- Threat: !InfrastructureShared
-- Name: Renocide
-- Type: 15

if string.match(Remediation.Threat.Name, "Worm:Win32/Renocide") then
  local l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\DRM")
  if l_0_0 then
    sysio.DeleteRegKey(l_0_0, "amty")
  end
  local l_0_1 = sysio.RegOpenKey("HKLM\\SOFTWARE\\temp")
  if l_0_1 then
    sysio.DeleteRegKey(l_0_1, "fox")
  end
  local l_0_2 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\Explorer\\Run")
  if l_0_2 then
    sysio.DeleteRegKey(l_0_2, "ctfnom")
    sysio.DeleteRegKey(l_0_2, "csrcs")
  end
  local l_0_3 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\RunServices")
  if l_0_3 then
    sysio.DeleteRegKey(l_0_3, "ctfnom")
    sysio.DeleteRegKey(l_0_3, "csrcs")
  end
  local l_0_4 = {
    "%windir%\\system32\\autorun.inf",
    "%windir%\\system32\\autorun.in",
    "%windir%\\system32\\autorun.i"
  }
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    sysio.DeleteFile(MpCommon.ExpandEnvironmentVariables(l_0_6))
  end
end
