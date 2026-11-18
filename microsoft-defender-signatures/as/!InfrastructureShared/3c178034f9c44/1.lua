-- Threat: !InfrastructureShared
-- Name: 3c178034f9c44
-- Type: 21

if mp.HSTR_WEIGHT < 26 then
  return mp.CLEAN
end
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
if l_0_0 < 2 then
  return mp.CLEAN
end
l_0_0 = 0
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
if l_0_0 < 3 then
  return mp.CLEAN
end
l_0_0 = 0
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
if hstrlog[15].matched then
  l_0_0 = l_0_0 + 1
end
if l_0_0 < 3 then
  return mp.CLEAN
end
if hstrlog[16].matched == false then
  return mp.CLEAN
end
return mp.INFECTED
