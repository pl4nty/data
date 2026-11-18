-- Threat: !InfrastructureShared
-- Name: 5378551b26a9
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.get_mpattribute("pea_hasexports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 197632 and mp.getfilesize() < 222208 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
