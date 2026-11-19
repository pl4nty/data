-- Threat: !InfrastructureShared
-- Name: 497836dfa254
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 15360 and peattributes.amd64_image then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
