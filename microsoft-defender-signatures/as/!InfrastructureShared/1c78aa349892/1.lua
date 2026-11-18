-- Threat: !InfrastructureShared
-- Name: 1c78aa349892
-- Type: 21

if pesecs[4].Name == "PACK" and peattributes.isdll == true and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
