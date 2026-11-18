-- Threat: !InfrastructureShared
-- Name: 1895c9662df3
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr + 5, 5)
local l_0_1 = mp.readu_u32(l_0_0, 2)
if l_0_1 < 3145728 then
  return mp.CLEAN
end
return mp.INFECTED
