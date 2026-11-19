-- Threat: !InfrastructureShared
-- Name: 51410a23e756
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
if #l_0_0 < 28 then
  return mp.INFECTED
end
if l_0_0:sub(1, 4) ~= "\000\000\000\000" then
  return mp.INFECTED
end
return mp.CLEAN
