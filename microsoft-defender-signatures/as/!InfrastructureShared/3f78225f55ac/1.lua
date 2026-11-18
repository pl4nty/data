-- Threat: !InfrastructureShared
-- Name: 3f78225f55ac
-- Type: 21

if peattributes.isdll == true and mp.get_mpattribute("NID:Trojan:Win64/Mikey.SXN!MTB") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
