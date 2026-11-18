-- Threat: !InfrastructureShared
-- Name: a8789d7cf971
-- Type: 21

if mp.get_mpattribute("pea_hasexports") and mp.get_mpattribute("pea_isdll") and mp.get_mpattribute("pea_amd64_image") and mp.getfilesize() >= 208384 and mp.getfilesize() < 232960 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
