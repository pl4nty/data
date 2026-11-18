-- Threat: !InfrastructureShared
-- Name: 2578c9f567a9
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 5600000 and mp.getfilesize() < 5700000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
