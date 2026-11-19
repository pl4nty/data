-- Threat: !InfrastructureShared
-- Name: c77832a9137f
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.getfilesize() > 4900 and mp.getfilesize() < 8000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
