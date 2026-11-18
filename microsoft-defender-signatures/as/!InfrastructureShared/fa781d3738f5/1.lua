-- Threat: !InfrastructureShared
-- Name: fa781d3738f5
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_relocs_stripped") and mp.get_mpattribute("pea_no_relocs") and mp.getfilesize() >= 315392 and mp.getfilesize() < 368640 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
