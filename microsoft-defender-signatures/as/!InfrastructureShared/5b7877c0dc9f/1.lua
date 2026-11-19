-- Threat: !InfrastructureShared
-- Name: 5b7877c0dc9f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 5000000 and peattributes.x86_image == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil and l_0_2.Signers.IsValid == true then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
