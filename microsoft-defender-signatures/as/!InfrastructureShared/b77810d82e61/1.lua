-- Threat: !InfrastructureShared
-- Name: b77810d82e61
-- Type: 21

if not mp.get_mpattribute("pea_genpacked") and mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 163840 and mp.getfilesize() < 200192 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
