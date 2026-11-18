-- Threat: !InfrastructureShared
-- Name: 9078b99187a0
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and pesecs[7].Name == ".vlizer" and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
