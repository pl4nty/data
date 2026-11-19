-- Threat: !InfrastructureShared
-- Name: 1b7831957503
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 1000000 and l_0_0 == 1 then
  return mp.INFECTED
end
return mp.CLEAN
