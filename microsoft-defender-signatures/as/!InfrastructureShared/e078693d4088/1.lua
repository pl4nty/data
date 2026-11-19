-- Threat: !InfrastructureShared
-- Name: e078693d4088
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 8000000 and hstrlog[1].matched and 2 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
