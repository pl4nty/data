-- Threat: !InfrastructureShared
-- Name: 3a780dd5f12d
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 307200 and mp.getfilesize() < 409600 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
