-- Threat: !InfrastructureShared
-- Name: 18c7858fbf9f4
-- Type: 21

if peattributes.isexe == true and pesecs[1].Name == "UPX0" and pesecs[2].Name == "UPX1" and pesecs[3].Name == "UPX2" and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
