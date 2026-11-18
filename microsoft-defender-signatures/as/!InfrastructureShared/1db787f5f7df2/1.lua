-- Threat: !InfrastructureShared
-- Name: 1db787f5f7df2
-- Type: 21

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
if hstrlog[15].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[16].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[17].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[1].matched or hstrlog[2].matched and l_0_0 == 15 then
  return mp.INFECTED
end
return mp.CLEAN
