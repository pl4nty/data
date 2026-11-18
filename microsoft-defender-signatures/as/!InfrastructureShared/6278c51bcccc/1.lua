-- Threat: !InfrastructureShared
-- Name: 6278c51bcccc
-- Type: 21

local l_0_0 = mp.getfilesize()
if 9728 <= l_0_0 and l_0_0 <= 13312 and hstrlog[1].matched and hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
