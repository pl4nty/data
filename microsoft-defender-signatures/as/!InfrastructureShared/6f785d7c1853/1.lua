-- Threat: !InfrastructureShared
-- Name: 6f785d7c1853
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
