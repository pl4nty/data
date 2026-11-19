-- Threat: !InfrastructureShared
-- Name: Berbew
-- Type: 15

if string.match(Remediation.Threat.Name, "Berbew") then
  local l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\IE4")
  if l_0_0 then
    sysio.DeleteRegValue(l_0_0, "MGR")
  end
  local l_0_1 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft")
  if l_0_1 then
    for l_0_2, l_0_3 in pairs(l_0_1) do
      local l_0_4 = sysio.RegOpenKey(l_0_3)
      if l_0_4 then
        sysio.DeleteRegValue(l_0_4, "QueenKarton")
        sysio.DeleteRegValue(l_0_4, "KingKarton")
        sysio.DeleteRegValue(l_0_4, "KKQHOOK")
      end
    end
  end
  local l_0_5 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")
  if l_0_5 then
    for l_0_6, l_0_7 in pairs(l_0_5) do
      local l_0_8 = sysio.RegOpenKey(l_0_7)
      if l_0_8 then
        sysio.DeleteRegValue(l_0_8, "SysTime")
        sysio.DeleteRegValue(l_0_8, "FormSuggest Passwords")
        sysio.DeleteRegValue(l_0_8, "FormSuggest PW Ask")
        sysio.DeleteRegValue(l_0_8, "Use FormSuggest")
      end
    end
  end
  local l_0_9 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\CurrentVersion\\Internet Settings\\Zones\\3")
  if l_0_9 then
    for l_0_10, l_0_11 in pairs(l_0_9) do
      local l_0_12 = sysio.RegOpenKey(l_0_11)
      if l_0_12 then
        sysio.SetRegValueAsDword(l_0_12, "1601", 1)
      end
    end
  end
  local l_0_13 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\CurrentVersion\\Internet Settings\\Zones\\4")
  if l_0_13 then
    for l_0_14, l_0_15 in pairs(l_0_13) do
      local l_0_16 = sysio.RegOpenKey(l_0_15)
      if l_0_16 then
        sysio.SetRegValueAsDword(l_0_16, "1601", 1)
      end
    end
  end
end
