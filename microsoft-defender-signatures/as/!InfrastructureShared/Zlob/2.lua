-- Threat: !InfrastructureShared
-- Name: Zlob
-- Type: 15

local l_0_0 = Remediation.Threat.Name
if type(l_0_0) ~= "string" then
  return
end
local l_0_1 = string.match(l_0_0, "^[^:]+:(.+)$") or l_0_0
local l_0_2 = string.lower(l_0_1)
if l_0_2 == "win32/zlob.bg" then
  local l_0_3 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")
  if l_0_3 then
    for l_0_4, l_0_5 in pairs(l_0_3) do
      local l_0_6 = sysio.RegOpenKey(l_0_5)
      if l_0_6 then
        local l_0_7 = sysio.GetRegValueAsString(l_0_6, "Start Page")
        if type(l_0_7) == "string" then
          local l_0_8 = string.lower(l_0_7)
          if l_0_8 == "http://mysearchpage.biz/home.html" then
            sysio.SetRegValueAsString(l_0_6, "Start Page", "http://go.microsoft.com/fwlink/?linkid=42826")
          end
        end
      end
    end
  end
  local l_0_9 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Search")
  if l_0_9 then
    local l_0_10 = sysio.GetRegValueAsString(l_0_9, "CustomizeSearch")
    if type(l_0_10) == "string" then
      local l_0_11 = string.lower(l_0_10)
      if l_0_11 == "http://mysearchpage.biz/customizesearch.html" then
        sysio.SetRegValueAsString(l_0_9, "CustomizeSearch", "http://go.microsoft.com/fwlink/?linkid=42826")
      end
    end
  end
end
if l_0_2 == "win32/zlob.j" then
  local l_0_12 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")
  if l_0_12 then
    for l_0_13, l_0_14 in pairs(l_0_12) do
      local l_0_15 = sysio.RegOpenKey(l_0_14)
      if l_0_15 then
        local l_0_16 = sysio.GetRegValueAsString(l_0_15, "Start Page")
        if type(l_0_16) == "string" then
          local l_0_17 = string.lower(l_0_16)
          if l_0_17 == "http://a-search.biz/" then
            sysio.SetRegValueAsString(l_0_15, "Start Page", "http://go.microsoft.com/fwlink/?linkid=42826")
          end
        end
      end
    end
  end
end
if string.find(l_0_0, "Zlob", 1, true) and Remediation.Threat.Active then
  Remediation.SetRebootRequired()
end
