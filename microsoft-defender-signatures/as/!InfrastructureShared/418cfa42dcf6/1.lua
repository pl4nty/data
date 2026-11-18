-- Threat: !InfrastructureShared
-- Name: 418cfa42dcf6
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 10000 and l_0_0 == 2 then
  return mp.INFECTED
end
return mp.CLEAN
