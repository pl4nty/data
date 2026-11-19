-- Threat: !InfrastructureShared
-- Name: 5d7804d20655
-- Type: 21

local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
if mp.getfilesize() > 40960 then
  return mp.CLEAN
end
return mp.INFECTED
