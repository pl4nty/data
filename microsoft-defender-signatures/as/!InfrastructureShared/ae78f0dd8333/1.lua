-- Threat: !InfrastructureShared
-- Name: ae78f0dd8333
-- Type: 21

if mp.get_mpattribute("pea_amd64_image") and mp.get_mpattribute("pea_isdll") and mp.get_mpattribute("pea_hasexports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 192512 and mp.getfilesize() < 217088 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
