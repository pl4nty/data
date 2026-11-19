-- Threat: !InfrastructureShared
-- Name: 87788b5320d3
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() > 3800 and mp.getfilesize() < 4500 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
