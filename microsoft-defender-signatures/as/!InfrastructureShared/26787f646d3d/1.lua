-- Threat: !InfrastructureShared
-- Name: 26787f646d3d
-- Type: 21

if epcode[1] == 233 and epcode[2] == 90 and epcode[3] == 94 and epcode[11] == 233 and peattributes.isexe == true and peattributes.amd64_image then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
