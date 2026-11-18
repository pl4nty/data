-- Threat: !InfrastructureShared
-- Name: 497828cac9b9
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
if l_0_0 == 3 and hstrlog[2].VA > hstrlog[1].VA and hstrlog[3].VA == hstrlog[2].VA + 98 then
  return mp.INFECTED
end
return mp.CLEAN
