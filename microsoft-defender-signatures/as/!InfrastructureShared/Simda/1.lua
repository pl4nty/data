-- Threat: !InfrastructureShared
-- Name: Simda
-- Type: 14

if Remediation.Threat.Active then
  for l_0_0, l_0_1 in pairs(Remediation.Threat.Resources) do
    if l_0_1.Schema == "file" and not string.match(Remediation.Threat.Name, "^Virus:WinNT/Simda") then
      Remediation.BtrDeleteFile(l_0_1.Path)
    end
  end
end
