-- Threat: !InfrastructureShared
-- Name: 25956ac29c5f
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr + 14, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
if l_0_1 < 4194304 then
  return mp.CLEAN
end
return mp.INFECTED
