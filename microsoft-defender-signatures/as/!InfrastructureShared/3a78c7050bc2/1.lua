-- Threat: !InfrastructureShared
-- Name: 3a78c7050bc2
-- Type: 21

if pesecs[6].Name == ".rsrc" and pesecs[6].Characteristics == 3758096416 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
