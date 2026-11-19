-- Threat: !InfrastructureShared
-- Name: Tofsee
-- Type: 15

local l_0_0 = Remediation.Threat
if l_0_0.Active and string.match(l_0_0.Name, "Backdoor:Win32/Tofsee") then
  local l_0_1 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  for l_0_2, l_0_3 in pairs(l_0_1) do
    local l_0_4 = "msconfig"
    local l_0_5 = sysio.RegOpenKey(l_0_3)
    if l_0_5 ~= nil then
      local l_0_6 = sysio.GetRegValueAsString(l_0_5, l_0_4)
      if l_0_6 ~= nil and string.match(l_0_6, "\\%l%l%l%l%l%l%l%l.exe") then
        sysio.DeleteRegValue(l_0_5, l_0_4)
        if string.byte(l_0_6) == 34 then
          l_0_6 = string.sub(l_0_6, 2, -2)
        end
        sysio.DeleteFile(l_0_6)
      end
    end
  end
end
