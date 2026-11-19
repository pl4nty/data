-- Threat: !InfrastructureShared
-- Name: 5761c0ac4a88
-- Type: 21

if peattributes.ismsil and mp.get_mpattribute("pea_isdll") then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
