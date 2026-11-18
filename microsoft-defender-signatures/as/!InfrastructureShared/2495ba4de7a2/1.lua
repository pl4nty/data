-- Threat: !InfrastructureShared
-- Name: 2495ba4de7a2
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr + 11, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
if l_0_1 < 1048576 then
  return mp.CLEAN
end
return mp.INFECTED
