-- Threat: !InfrastructureShared
-- Name: b378210fc99e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 350000 and mp.getfilesize() < 360000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
