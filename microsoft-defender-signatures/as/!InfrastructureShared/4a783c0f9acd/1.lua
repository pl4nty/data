-- Threat: !InfrastructureShared
-- Name: 4a783c0f9acd
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
