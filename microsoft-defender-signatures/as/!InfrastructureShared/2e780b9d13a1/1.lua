-- Threat: !InfrastructureShared
-- Name: 2e780b9d13a1
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Worm:Win32/VBInject.G2!MTB") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
