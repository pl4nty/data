-- Threat: !InfrastructureShared
-- Name: 8d78e59b22e6
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 650000 and l_0_0 == 2 then
  return mp.INFECTED
end
return mp.CLEAN
