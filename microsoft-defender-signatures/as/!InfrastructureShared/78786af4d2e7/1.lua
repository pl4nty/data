-- Threat: !InfrastructureShared
-- Name: 78786af4d2e7
-- Type: 21

if pehdr.NumberOfSections == 8 and pesecs[2].Name == ".managed" and pesecs[2].Characteristics == 1610612768 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
