-- Threat: !InfrastructureShared
-- Name: 4078878437f1
-- Type: 21

if peattributes.isexe == true and pesecs[4].Name == ".sn6" and pesecs[7].Name == ".83&" then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
