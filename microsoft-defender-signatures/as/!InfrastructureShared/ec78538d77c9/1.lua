-- Threat: !InfrastructureShared
-- Name: ec78538d77c9
-- Type: 21

if mp.getfilesize() > 302000 and mp.getfilesize() < 520000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
