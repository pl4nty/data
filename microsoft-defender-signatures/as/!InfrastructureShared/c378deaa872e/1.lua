-- Threat: !InfrastructureShared
-- Name: c378deaa872e
-- Type: 21

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_executable_image") and mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.get_mpattribute("pea_no_boundimport") and mp.get_mpattribute("pea_no_delayimport") and mp.getfilesize() >= 696320 and mp.getfilesize() < 937984 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
