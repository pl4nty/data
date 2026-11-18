-- Threat: !InfrastructureShared
-- Name: BrobanDel
-- Type: 15

local l_0_0
for l_0_1, l_0_2 in pairs(Remediation.Threat.Resources) do
  if l_0_2.Schema == "file" and string.match(Remediation.Threat.Name, "JS/BrobanDel") then
    l_0_0 = l_0_2.Path
  end
end
local l_0_3 = false
if l_0_0 then
  local l_0_4 = sysio.RegOpenKey("HKCU\\Software\\Mozilla\\Firefox\\Extensions")
  if l_0_4 then
    local l_0_5 = sysio.RegEnumValues(l_0_4)
    for l_0_6, l_0_7 in pairs(l_0_5) do
      if l_0_7 then
        local l_0_8 = sysio.GetRegValueAsString(l_0_4, l_0_7)
        if string.match(l_0_0, l_0_8) then
          sysio.DeleteRegValue(l_0_4, l_0_7)
          sysio.DeleteFile(l_0_8)
          l_0_3 = true
        end
      end
    end
  end
end
if l_0_0 and not l_0_3 then
  local l_0_9, l_0_10 = string.find(l_0_0, "%.xpi%-")
  if l_0_9 then
    local l_0_11 = string.sub(l_0_0, 0, l_0_10 - 1)
    sysio.DeleteFile(l_0_11)
  end
end
