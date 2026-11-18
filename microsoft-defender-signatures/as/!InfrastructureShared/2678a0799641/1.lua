-- Threat: !InfrastructureShared
-- Name: 2678a0799641
-- Type: 21

if peattributes.isdll == true and pesecs[4].Name == ".5{," and pesecs[4].Characteristics == 1610612768 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
