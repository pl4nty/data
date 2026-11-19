-- Threat: !InfrastructureShared
-- Name: 897839b51097
-- Type: 21

if epcode[1] == 232 and epcode[5] == 0 and epcode[6] == 233 and epcode[10] == 255 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
