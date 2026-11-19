-- Threat: !InfrastructureShared
-- Name: 12b7818ea6118
-- Type: 21

if mp.get_mpattribute("pea_hasexports") and mp.getfilesize() >= 1482752 and mp.getfilesize() < 1507328 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
