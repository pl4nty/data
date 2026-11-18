-- Threat: !InfrastructureShared
-- Name: Powemet
-- Type: 15

local l_0_0
local l_0_1 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
local l_0_2 = sysio.RegOpenKey(l_0_1)
if l_0_2 then
  local l_0_3 = sysio.RegEnumValues(l_0_2)
  for l_0_4, l_0_5 in pairs(l_0_3) do
    l_0_0 = string.lower(sysio.GetRegValueAsString(l_0_2, l_0_5))
    if l_0_0 ~= nil then
      if string.match(l_0_0, "regsvr32.+/i%:http.+scrobj%.dll") and string.find(l_0_0, "/u ", 1, true) and string.find(l_0_0, "/s ", 1, true) then
        sysio.DeleteRegValue(l_0_2, l_0_5)
      end
      if string.find(l_0_0, "powershell.exe", 1, true) and string.match(l_0_0, "iex%s*%(%[text%.encoding%]%:%:ascii%.getstring%(%[convert%]%:%:frombase64string%(%(gp%s*%'hk") then
        sysio.DeleteRegValue(l_0_2, l_0_5)
      end
    end
  end
end
l_0_2 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run")
if l_0_2 then
  local l_0_6 = sysio.RegEnumValues(l_0_2)
  for l_0_7, l_0_8 in pairs(l_0_6) do
    l_0_0 = string.lower(sysio.GetRegValueAsString(l_0_2, l_0_8))
    if l_0_0 ~= nil then
      if string.match(l_0_0, "regsvr32.+/i%:http.+scrobj%.dll") and string.find(l_0_0, "/u ", 1, true) and string.find(l_0_0, "/s ", 1, true) then
        sysio.DeleteRegValue(l_0_2, l_0_8)
      end
      if string.find(l_0_0, "powershell.exe", 1, true) and string.match(l_0_0, "iex%s*%(%[text%.encoding%]%:%:ascii%.getstring%(%[convert%]%:%:frombase64string%(%(gp%s*%'hk") then
        sysio.DeleteRegValue(l_0_2, l_0_8)
      end
    end
  end
end
