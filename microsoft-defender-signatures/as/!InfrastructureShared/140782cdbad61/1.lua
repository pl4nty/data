-- Threat: !InfrastructureShared
-- Name: 140782cdbad61
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and mp.getfilesize() < 60000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
