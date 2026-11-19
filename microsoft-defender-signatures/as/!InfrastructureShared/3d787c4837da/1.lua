-- Threat: !InfrastructureShared
-- Name: 3d787c4837da
-- Type: 21

if peattributes.amd64_image and peattributes.isexe and mp.getfilesize() <= 262144 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
