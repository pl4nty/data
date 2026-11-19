-- Threat: !InfrastructureShared
-- Name: 2695ab9bba60
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr + 16, 5)
local l_0_1 = mp.readu_u32(l_0_0, 2)
if l_0_1 < 9437184 then
  return mp.CLEAN
end
return mp.INFECTED
