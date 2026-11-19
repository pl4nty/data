-- Threat: !InfrastructureShared
-- Name: 9d7814dd676c
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.getfilesize() >= 299008 and mp.getfilesize() < 323584 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
