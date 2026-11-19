-- Threat: !InfrastructureShared
-- Name: 18959889b647
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr, 11)
local l_0_1 = mp.readu_u32(l_0_0, 7)
if l_0_1 < 4194304 then
  return mp.CLEAN
end
return mp.INFECTED
