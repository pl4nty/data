-- Threat: !InfrastructureShared
-- Name: 4d7802750f78
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() <= 14000000 and mp.getfilesize() >= 12000000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
