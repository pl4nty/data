-- Threat: !InfrastructureShared
-- Name: 7d78cf430dd6
-- Type: 21

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") then
  if mp.getfilesize() < 20480 then
    local l_0_0 = mp.GetCertificateInfo()
    for l_0_1, l_0_2 in pairs(l_0_0) do
      if l_0_2.Signers ~= nil then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
  if mp.getfilesize() >= 20480 and mp.getfilesize() < 49152 then
    return mp.INFECTED
  end
end
return mp.CLEAN
