-- Threat: !InfrastructureShared
-- Name: 1bd053722d25
-- Type: 21

mp.readprotection(false)
local l_0_0 = mp.readfile(4, 8)
mp.readprotection(true)
local l_0_1 = mp.readu_u32(l_0_0, 1)
local l_0_2 = mp.readu_u32(l_0_0, 5)
if 32 <= l_0_1 and 4096 <= l_0_2 and mp.getfilesize() == 28 + l_0_1 + l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
