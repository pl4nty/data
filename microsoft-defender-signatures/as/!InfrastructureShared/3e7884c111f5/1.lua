-- Threat: !InfrastructureShared
-- Name: 3e7884c111f5
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Trojan:Win64/Zusy.SXN!MTB") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
