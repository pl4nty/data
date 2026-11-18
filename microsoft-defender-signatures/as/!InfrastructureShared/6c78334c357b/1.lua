-- Threat: !InfrastructureShared
-- Name: 6c78334c357b
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
if (hstrlog[1].matched or hstrlog[2].matched) and l_0_0 == 3 then
  return mp.INFECTED
end
return mp.CLEAN
