-- Threat: !InfrastructureShared
-- Name: 817832c9b022
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 93000 and mp.getfilesize() < 99000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
