-- Threat: !InfrastructureShared
-- Name: BrobanLaw
-- Type: 15

local l_0_0 = false
for l_0_1, l_0_2 in pairs(Remediation.Threat.Resources) do
  if l_0_2.Schema == "file" and string.match(Remediation.Threat.Name, "BrobanLaw") then
    l_0_0 = true
    break
  end
end
if l_0_0 then
  local l_0_3 = sysio.RegOpenKey("HKLM\\SOFTWARE\\AXSPH")
  if l_0_3 then
    sysio.DeleteRegKey(l_0_3, nil)
  end
  local l_0_4 = sysio.RegOpenKey("HKCU\\SOFTWARE\\fgiusji")
  if l_0_4 then
    sysio.DeleteRegKey(l_0_4, nil)
  end
end
