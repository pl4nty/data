-- Threat: !InfrastructureShared
-- Name: b078659f3d0d
-- Type: 21

if peattributes.isexe == true and pesecs[5].Name == ".aspack" then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
