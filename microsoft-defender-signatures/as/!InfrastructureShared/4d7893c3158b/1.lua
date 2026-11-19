-- Threat: !InfrastructureShared
-- Name: 4d7893c3158b
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 20000 and 1 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
