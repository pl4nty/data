-- Threat: !InfrastructureShared
-- Name: 5b8c38b9d21e
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[5].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[6].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[7].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() > 1000000 and mp.getfilesize() < 10000000 and hstrlog[1].hitcount > 20 and hstrlog[2].hitcount > 15 and 15 < hstrlog[3].hitcount and l_0_0 == 4 then
  return mp.INFECTED
end
return mp.CLEAN
