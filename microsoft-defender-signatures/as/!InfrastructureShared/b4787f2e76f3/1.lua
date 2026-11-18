-- Threat: !InfrastructureShared
-- Name: b4787f2e76f3
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
if mp.getfilesize() < 50000 and 1 <= l_0_0 and (hstrlog[5].matched or hstrlog[6].matched) and hstrlog[7].matched and hstrlog[8].matched then
  return mp.INFECTED
end
return mp.CLEAN
