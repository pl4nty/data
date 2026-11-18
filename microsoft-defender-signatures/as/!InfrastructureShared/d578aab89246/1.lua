-- Threat: !InfrastructureShared
-- Name: d578aab89246
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 500000 and l_0_0 == 3 then
  return mp.INFECTED
end
return mp.CLEAN
