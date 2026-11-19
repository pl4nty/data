-- Threat: !InfrastructureShared
-- Name: 1617869ccfbe7
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.get_mpattribute("pea_suspicious_section_name") and mp.getfilesize() >= 1331200 and mp.getfilesize() < 1347584 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
