-- Threat: !InfrastructureShared
-- Name: 5978438689a7
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 8000000 and mp.getfilesize() < 12000000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
