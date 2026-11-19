-- Threat: !InfrastructureShared
-- Name: 189537e4e2b0
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr, 11)
local l_0_1 = mp.readu_u32(l_0_0, 7)
if l_0_1 < 2097152 then
  return mp.CLEAN
end
return mp.INFECTED
