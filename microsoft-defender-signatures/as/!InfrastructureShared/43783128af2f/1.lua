-- Threat: !InfrastructureShared
-- Name: 43783128af2f
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
