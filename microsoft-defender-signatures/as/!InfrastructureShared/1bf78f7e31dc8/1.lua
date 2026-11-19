-- Threat: !InfrastructureShared
-- Name: 1bf78f7e31dc8
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and not mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 1131776 and mp.getfilesize() < 1156352 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
