-- Threat: !InfrastructureShared
-- Name: 289534f0d154
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr + 18, 5)
local l_0_1 = mp.readu_u32(l_0_0, 2)
if l_0_1 < 9437184 then
  return mp.CLEAN
end
return mp.INFECTED
