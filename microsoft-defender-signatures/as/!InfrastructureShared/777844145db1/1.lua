-- Threat: !InfrastructureShared
-- Name: 777844145db1
-- Type: 21

if peattributes.isexe == true and pesecs[6].Name == "qhnxjbuu" and pesecs[5].Name == "dyzwkzqi" then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
