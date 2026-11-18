-- Threat: !InfrastructureShared
-- Name: a87810f782b3
-- Type: 21

if peattributes.isexe == true and (pesecs[1].Name == "UPX0" or pesecs[1].Name == ".text") and (pesecs[2].Name == "UPX1" or pesecs[2].Name == ".bss") and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
