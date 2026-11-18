-- Threat: !InfrastructureShared
-- Name: Tupym
-- Type: 15

local function l_0_0(l_1_0, l_1_1)
  return type(l_1_0) == "string" and type(l_1_1) == "string" and l_1_0:lower() == l_1_1:lower()
end

local l_0_1 = Remediation.Threat.Name
local l_0_3 = type(l_0_1) == "string" and (string.match(l_0_1, "/Tupym$") ~= nil or string.match(l_0_1, "/Tupym[^%w]") ~= nil)
if l_0_3 then
  local l_0_4 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon")
  if l_0_4 then
    sysio.SetRegValueAsString(l_0_4, "Shell", "explorer.exe")
  end
  local l_0_5 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System")
  if l_0_5 then
    for l_0_6, l_0_7 in pairs(l_0_5) do
      local l_0_8 = sysio.RegOpenKey(l_0_7)
      if l_0_8 then
        sysio.DeleteRegValue(l_0_8, "DisableTaskMgr")
      end
    end
  end
  local l_0_9 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System")
  if l_0_9 then
    for l_0_10, l_0_11 in pairs(l_0_9) do
      local l_0_12 = sysio.RegOpenKey(l_0_11)
      if l_0_12 then
        sysio.DeleteRegValue(l_0_12, "DisableRegistryTools")
      end
    end
  end
  local l_0_13 = 0
  local l_0_14 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")
  if l_0_14 then
    for l_0_15, l_0_16 in pairs(l_0_14) do
      local l_0_17 = sysio.RegOpenKey(l_0_16)
      if l_0_17 then
        local l_0_18 = sysio.GetRegValueAsString(l_0_17, "Start Page")
        if l_0_0(l_0_18, "http://www.mydreamworld.50webs.com") then
          sysio.SetRegValueAsString(l_0_17, "Start Page", "http://www.msn.com/?pc=MSERT1")
          l_0_13 = 1
        end
        if l_0_0(l_0_18, "http://www.advgoogle.blogdpot.com") then
          sysio.SetRegValueAsString(l_0_17, "Start Page", "http://www.msn.com/?pc=MSERT1")
          l_0_13 = 1
        end
      end
    end
  end
  if l_0_13 == 1 then
    local l_0_19 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main")
    if l_0_19 then
      sysio.SetRegValueAsString(l_0_19, "Start Page", "http://www.msn.com/?pc=MSERT1")
      sysio.SetRegValueAsString(l_0_19, "Default_Page_URL", "http://www.msn.com/?pc=MSERT1")
      sysio.SetRegValueAsString(l_0_19, "Default_Search_URL", "http://go.microsoft.com/fwlink/?linkid=42826")
      sysio.SetRegValueAsString(l_0_19, "Search Page", "http://go.microsoft.com/fwlink/?linkid=42826")
      sysio.SetRegValueAsString(l_0_19, "Local Page", "http://go.microsoft.com/fwlink/?linkid=42826")
    end
  end
end
