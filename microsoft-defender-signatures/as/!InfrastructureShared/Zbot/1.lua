-- Threat: !InfrastructureShared
-- Name: Zbot
-- Type: 15

local l_0_0 = Remediation.Threat
if l_0_0.Active and string.match(l_0_0.Name, "PWS:Win32/Zbot.*") then
  for l_0_1, l_0_2 in pairs(l_0_0.Resources) do
    if l_0_2.Schema == "hiddenfile" then
      Remediation.BtrDeleteFile(l_0_2.Path)
    end
  end
end
