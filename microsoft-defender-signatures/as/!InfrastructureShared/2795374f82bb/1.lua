-- Threat: !InfrastructureShared
-- Name: 2795374f82bb
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 9, 3)
if string.byte(l_0_0, 1) + 119 == string.byte(l_0_0, 3) then
  return mp.INFECTED
end
return mp.CLEAN
