-- Threat: !InfrastructureShared
-- Name: 1e9582657916
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr + 6, 5)
local l_0_1 = mp.readu_u32(l_0_0, 2)
if l_0_1 < 1048576 then
  return mp.CLEAN
end
return mp.INFECTED
