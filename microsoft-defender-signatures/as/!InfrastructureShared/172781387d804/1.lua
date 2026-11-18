-- Threat: !InfrastructureShared
-- Name: 172781387d804
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
if hstrlog[5].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 900000 and 2 <= l_0_0 or hstrlog[6].VA == mp.getfilesize() - 22 + pehdr.ImageBase then
  return mp.INFECTED
end
return mp.CLEAN
