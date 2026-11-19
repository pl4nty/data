-- Threat: !InfrastructureShared
-- Name: ec782a02d67d
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil and l_0_2.Signers.IsValid == true then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
