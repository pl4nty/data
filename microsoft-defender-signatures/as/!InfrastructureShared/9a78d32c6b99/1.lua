-- Threat: !InfrastructureShared
-- Name: 9a78d32c6b99
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 1002672 and mp.getfilesize() < 1752672 and peattributes.amd64_image then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
