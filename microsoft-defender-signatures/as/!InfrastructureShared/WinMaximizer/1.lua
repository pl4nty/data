-- Threat: !InfrastructureShared
-- Name: WinMaximizer
-- Type: 15

if string.match(Remediation.Threat.Name, "Program:Win32/WinMaximizer") then
  local l_0_0 = MpCommon.ExpandEnvironmentVariables("%windir%\\Tasks")
  if l_0_0 then
    local l_0_1 = sysio.FindFiles(l_0_0, "SLOW-PCfighter*.job", 0)
    if l_0_1 then
      for l_0_2, l_0_3 in pairs(l_0_1) do
        sysio.DeleteFile(l_0_3)
      end
    end
  end
  sysio.DeleteFile("%common_appdata%\\Fighters\\Tray\\Configurations\\RCPRO.xml")
  local l_0_4 = {
    "%programfiles%\\Fighters\\SLOW-PCfighter\\Languages",
    "%programfiles%\\Fighters\\slow-pcfighter",
    "%common_appdata%\\Fighters\\SLOW-PCfighter"
  }
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    local l_0_7 = MpCommon.ExpandEnvironmentVariables(l_0_6)
    if l_0_7 then
      local l_0_8 = sysio.FindFiles(l_0_7, "*", 0)
      if l_0_8 then
        for l_0_9, l_0_10 in pairs(l_0_8) do
          sysio.DeleteFile(l_0_10)
        end
      end
    end
  end
end
