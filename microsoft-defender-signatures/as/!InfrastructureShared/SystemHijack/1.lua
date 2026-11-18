-- Threat: !InfrastructureShared
-- Name: SystemHijack
-- Type: 15

if string.match(Remediation.Threat.Name, "SystemHijack") then
  local l_0_0 = 0
  local l_0_1 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")
  if l_0_1 then
    for l_0_2, l_0_3 in pairs(l_0_1) do
      local l_0_4 = sysio.RegOpenKey(l_0_3)
      if l_0_4 then
        local l_0_5 = sysio.GetRegValueAsString(l_0_4, "Start Page")
        if type(l_0_5) == "string" and string.lower(l_0_5) == "http://www.2345.com/?18181" then
          sysio.SetRegValueAsString(l_0_4, "Start Page", "http://www.msn.com/?pc=MSERT1")
          l_0_0 = 1
        end
      end
    end
  end
  if l_0_0 == 1 then
    local l_0_6 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main")
    if l_0_6 then
      sysio.SetRegValueAsString(l_0_6, "Start Page", "http://www.msn.com/?pc=MSERT1")
      sysio.SetRegValueAsString(l_0_6, "Default_Page_URL", "http://www.msn.com/?pc=MSERT1")
      sysio.SetRegValueAsString(l_0_6, "Default_Search_URL", "http://go.microsoft.com/fwlink/?linkid=42826")
      sysio.SetRegValueAsString(l_0_6, "Search Page", "http://go.microsoft.com/fwlink/?linkid=42826")
    end
  end
end
