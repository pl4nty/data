-- Threat: !InfrastructureShared
-- Name: Esfury
-- Type: 15

if string.match(Remediation.Threat.Name, "Esfury") then
  local l_0_0 = "http://go.microsoft.com/fwlink/?linkid=42826"
  local l_0_1 = {
    "http://www.nuevaq.fm",
    "http://0-2-t-9-r-6-p-4-4-4-s-0-h-e-.i-k-r-g-1-0-u-5-1-f-3-g-li-9-p-1-x-t-6-g-l-8-m-q-y-s-k-6-l.info",
    "http://7-.j-z-0-3-0-u-u-x-f-1l-3-l-h-w-b-q-z-u-5-n-l-l-m-s-5-v-s-z-g.info"
  }
  local l_0_2 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")
  if l_0_2 then
    for l_0_3, l_0_4 in pairs(l_0_2) do
      local l_0_5 = sysio.RegOpenKey(l_0_4)
      if l_0_5 then
        local l_0_6 = sysio.GetRegValueAsString(l_0_5, "Start Page")
        if l_0_6 ~= nil then
          for l_0_7, l_0_8 in ipairs(l_0_1) do
            if l_0_6 == l_0_8 then
              sysio.SetRegValueAsString(l_0_5, "Start Page", l_0_0)
            end
          end
        end
      end
    end
  end
  local l_0_9 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main")
  if l_0_9 then
    sysio.SetRegValueAsString(l_0_9, "Start Page", l_0_0)
    sysio.SetRegValueAsString(l_0_9, "Default_Page_URL", l_0_0)
    sysio.SetRegValueAsString(l_0_9, "Default_Search_URL", l_0_0)
    sysio.SetRegValueAsString(l_0_9, "Search Page", l_0_0)
    sysio.SetRegValueAsString(l_0_9, "Local Page", l_0_0)
  end
  local l_0_10 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options"
  local l_0_11 = sysio.RegOpenKey(l_0_10)
  if l_0_11 then
    local l_0_12 = sysio.RegEnumKeys(l_0_11)
    if l_0_12 then
      for l_0_13, l_0_14 in pairs(l_0_12) do
        local l_0_15 = sysio.RegOpenKey(l_0_10 .. "\\" .. l_0_14)
        if l_0_15 then
          sysio.DeleteRegValue(l_0_15, "Debugger")
        end
      end
    end
  end
end
