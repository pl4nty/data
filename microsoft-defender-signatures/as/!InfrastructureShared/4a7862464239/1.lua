-- Threat: !InfrastructureShared
-- Name: 4a7862464239
-- Type: 21

if peattributes.is_process then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
