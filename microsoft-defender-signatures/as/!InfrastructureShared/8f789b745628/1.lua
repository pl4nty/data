-- Threat: !InfrastructureShared
-- Name: 8f789b745628
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 25600 and peattributes.amd64_image then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
