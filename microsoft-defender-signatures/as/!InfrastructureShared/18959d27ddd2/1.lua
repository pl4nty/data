-- Threat: !InfrastructureShared
-- Name: 18959d27ddd2
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr + 7, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
if l_0_1 < 16777216 then
  return mp.CLEAN
end
return mp.INFECTED
