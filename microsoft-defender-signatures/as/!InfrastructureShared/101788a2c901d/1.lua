-- Threat: !InfrastructureShared
-- Name: 101788a2c901d
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 300000 and (l_0_0 == 2 or hstrlog[3].matched) then
  return mp.INFECTED
end
return mp.CLEAN
