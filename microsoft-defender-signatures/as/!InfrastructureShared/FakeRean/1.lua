-- Threat: !InfrastructureShared
-- Name: FakeRean
-- Type: 15

if string.match(Remediation.Threat.Name, "FakeRean") and Remediation.Threat.Active then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Classes\\.exe")
  if l_0_0 then
    for l_0_1, l_0_2 in pairs(l_0_0) do
      local l_0_3 = sysio.RegOpenKey(l_0_2)
      if l_0_3 then
        sysio.SetRegValueAsString(l_0_3, nil, "exefile")
      end
    end
  end
  local l_0_4
  local l_0_5 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion")
  if l_0_5 then
    l_0_4 = sysio.GetRegValueAsString(l_0_5, "ProgramFilesDir (x86)")
  end
  local l_0_6 = sysio.RegOpenKey("HKLM\\Software\\Clients\\StartMenuInternet\\IEXPLORE.EXE\\shell\\open\\command")
  if l_0_6 then
    if l_0_4 ~= nil then
      sysio.SetRegValueAsStringExpand(l_0_6, nil, "%ProgramFiles(x86)%\\Internet Explorer\\iexplore.exe")
    else
      sysio.SetRegValueAsStringExpand(l_0_6, nil, "%programfiles%\\Internet Explorer\\iexplore.exe")
    end
  end
  local l_0_7 = sysio.RegExpandUserKey("HKCU\\Software\\Classes")
  if l_0_7 then
    for l_0_8, l_0_9 in pairs(l_0_7) do
      local l_0_10 = sysio.RegOpenKey(l_0_9)
      if l_0_10 then
        sysio.DeleteRegKey(l_0_10, ".exe")
        sysio.DeleteRegKey(l_0_10, "secfile")
      end
    end
  end
end
