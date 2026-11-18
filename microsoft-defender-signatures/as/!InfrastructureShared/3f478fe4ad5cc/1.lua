-- Threat: !InfrastructureShared
-- Name: 3f478fe4ad5cc
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
if hstrlog[6].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[7].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[8].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[9].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[10].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[11].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[12].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[13].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[14].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 500000 and (hstrlog[1].matched or 3 <= l_0_0) or 5 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
