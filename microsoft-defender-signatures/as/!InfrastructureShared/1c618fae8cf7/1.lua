-- Threat: !InfrastructureShared
-- Name: 1c618fae8cf7
-- Type: 21

local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
