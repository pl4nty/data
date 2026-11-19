-- Threat: !InfrastructureShared
-- Name: 4b7824e38d2e
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1000000 and mp.getfilesize() < 1100000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
