-- Threat: !InfrastructureShared
-- Name: 1ae615b934692
-- Type: 21

local l_0_0 = hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched
local l_0_1 = hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched or hstrlog[16].matched or hstrlog[17].matched
if l_0_0 and l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
