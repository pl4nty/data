-- Threat: !InfrastructureShared
-- Name: a778f768156d
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Ransom:Win32/Crypmodng.PGU1!MTB") and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
