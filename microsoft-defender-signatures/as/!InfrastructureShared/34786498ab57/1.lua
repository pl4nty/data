-- Threat: !InfrastructureShared
-- Name: 34786498ab57
-- Type: 21

local l_0_0 = mp.getfilesize()
if 20000000 < l_0_0 or l_0_0 < 17000000 then
  return mp.CLEAN
end
local l_0_1 = mp.GetCertificateInfo()
for l_0_2, l_0_3 in pairs(l_0_1) do
  if l_0_3.Signers ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
