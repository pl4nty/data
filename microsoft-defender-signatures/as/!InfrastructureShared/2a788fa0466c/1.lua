-- Threat: !InfrastructureShared
-- Name: 2a788fa0466c
-- Type: 21

if peattributes.no_security and mp.getfilesize() > 2000000 and mp.getfilesize() < 3000000 and peattributes.isexe == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
