-- Threat: !InfrastructureShared
-- Name: 5c78413ed9fe
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.ismsil == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
