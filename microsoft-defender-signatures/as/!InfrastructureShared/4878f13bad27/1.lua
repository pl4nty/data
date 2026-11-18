-- Threat: !InfrastructureShared
-- Name: 4878f13bad27
-- Type: 21

if peattributes.no_security and mp.getfilesize() > 100000 and mp.getfilesize() < 230000 and peattributes.isdll == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
