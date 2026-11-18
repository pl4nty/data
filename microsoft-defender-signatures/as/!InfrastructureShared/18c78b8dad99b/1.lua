-- Threat: !InfrastructureShared
-- Name: 18c78b8dad99b
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 3500000 and mp.getfilesize() < 3800000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
