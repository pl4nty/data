-- Threat: !InfrastructureShared
-- Name: 4e78cdd0880a
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 122880 and mp.getfilesize() < 147456 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
