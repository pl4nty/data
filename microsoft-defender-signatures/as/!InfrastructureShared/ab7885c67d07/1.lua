-- Threat: !InfrastructureShared
-- Name: ab7885c67d07
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isdll and peattributes.ismsil and mp.getfilesize() < 15000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
