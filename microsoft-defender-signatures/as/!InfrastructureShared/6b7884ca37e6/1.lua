-- Threat: !InfrastructureShared
-- Name: 6b7884ca37e6
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
