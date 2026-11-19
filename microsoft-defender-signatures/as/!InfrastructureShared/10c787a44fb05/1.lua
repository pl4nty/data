-- Threat: !InfrastructureShared
-- Name: 10c787a44fb05
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[1].matched and hstrlog[2].matched or 1 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
