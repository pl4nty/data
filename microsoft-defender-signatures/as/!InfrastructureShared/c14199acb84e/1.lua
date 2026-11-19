-- Threat: !InfrastructureShared
-- Name: c14199acb84e
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.get_mpattribute("pea_no_exports") and peattributes.ismsil == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
