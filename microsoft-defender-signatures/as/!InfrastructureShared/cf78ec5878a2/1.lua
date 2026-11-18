-- Threat: !InfrastructureShared
-- Name: cf78ec5878a2
-- Type: 21

if peattributes.isdll then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
