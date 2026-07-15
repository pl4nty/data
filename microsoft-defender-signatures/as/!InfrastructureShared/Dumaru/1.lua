-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Dumaru\1.luac 

-- params : ...
-- function num : 0
if (string.match)((Remediation.Threat).Name, "Dumaru") then
  local l_0_0 = (sysio.RegOpenKey)("HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon")
  if l_0_0 then
    (sysio.SetRegValueAsString)(l_0_0, "Shell", "Explorer.exe")
  end
  ;
  (Remediation.SetRebootRequired)()
  if (string.match)((Remediation.Threat).Name, "Dumaru%.AN") then
    Infrastructure_FixHostsFile()
  end
end

