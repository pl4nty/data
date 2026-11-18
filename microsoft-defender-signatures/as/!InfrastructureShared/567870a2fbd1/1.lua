-- Threat: !InfrastructureShared
-- Name: 567870a2fbd1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
