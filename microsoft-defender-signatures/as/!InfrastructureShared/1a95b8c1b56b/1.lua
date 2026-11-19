-- Threat: !InfrastructureShared
-- Name: 1a95b8c1b56b
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr + 7, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
if l_0_1 < 12288 then
  return mp.CLEAN
end
return mp.INFECTED
