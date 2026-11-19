-- Threat: !InfrastructureShared
-- Name: 1a0784d5101f6
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 180000 and mp.getfilesize() < 220000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
