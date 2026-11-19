-- Threat: !InfrastructureShared
-- Name: 1495c6fe35fe
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr - 4, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
if l_0_1 < 2097152 then
  return mp.CLEAN
end
return mp.INFECTED
