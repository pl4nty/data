-- Threat: !InfrastructureShared
-- Name: 1bc78d4e26d25
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 147460 and mp.get_mpattribute("pea_no_security") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
