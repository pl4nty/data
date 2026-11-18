-- Threat: !InfrastructureShared
-- Name: 15f78e7c332a0
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
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 200000 and 2 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
