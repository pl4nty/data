-- Threat: !InfrastructureShared
-- Name: 19478bb538576
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 36868 and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
