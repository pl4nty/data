-- Threat: !InfrastructureShared
-- Name: d8782103698a
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[5].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 1000000 and hstrlog[1].VA == 0 + pehdr.ImageBase and hstrlog[6].hitcount > 10 and hstrlog[2].matched and 2 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
