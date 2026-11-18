-- Threat: !InfrastructureShared
-- Name: 25954deeff7c
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr, 9)
local l_0_1 = mp.readu_u32(l_0_0, 6)
if l_0_1 < 983040 then
  return mp.CLEAN
end
return mp.INFECTED
