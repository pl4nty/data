-- Threat: !InfrastructureShared
-- Name: Netsky
-- Type: 15

if string.match(Remediation.Threat.Name, "Netsky") then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Classes\\CLSID\\{E6FB5E20-DE35-11CF-9C87-00AA005127ED}\\InProcServer32")
  if l_0_0 then
    for l_0_1, l_0_2 in pairs(l_0_0) do
      local l_0_3 = sysio.RegOpenKey(l_0_2)
      if l_0_3 then
        sysio.SetRegValueAsStringExpand(l_0_3, nil, "%SystemRoot%\\system32\\webcheck.dll")
        sysio.SetRegValueAsString(l_0_3, "ThreadingModel", "Apartment")
      end
    end
  end
  local l_0_4 = sysio.RegOpenKey("HKLM\\Software\\Classes\\CLSID\\{E6FB5E20-DE35-11CF-9C87-00AA005127ED}\\InProcServer32")
  if l_0_4 then
    sysio.SetRegValueAsStringExpand(l_0_4, nil, "%SystemRoot%\\system32\\webcheck.dll")
    sysio.SetRegValueAsString(l_0_4, "ThreadingModel", "Apartment")
  end
end
