-- Threat: !InfrastructureShared
-- Name: 1227862e97c14
-- Type: 21

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
if 7 <= l_0_0 and mp.getfilesize() < 483328 then
  return mp.INFECTED
end
return mp.CLEAN
