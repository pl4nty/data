-- Threat: !InfrastructureShared
-- Name: af784d5b6780
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[5].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched and 1 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
