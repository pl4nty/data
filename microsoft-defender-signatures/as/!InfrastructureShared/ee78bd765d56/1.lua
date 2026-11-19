-- Threat: !InfrastructureShared
-- Name: ee78bd765d56
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and not mp.get_mpattribute("pea_no_tls") and mp.get_mpattribute("pea_packed") and mp.getfilesize() >= 1081344 and mp.getfilesize() < 1105920 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
