-- Threat: !InfrastructureShared
-- Name: 2278ca1725b3
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 280000 and mp.getfilesize() < 290000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
