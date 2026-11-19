-- Threat: !InfrastructureShared
-- Name: 418921d009b6
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 1, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
mp.readprotection(false)
local l_0_2 = pe.mmap_va(l_0_1, 9)
if l_0_2 == "myapp.exe" then
  return mp.INFECTED
end
return mp.CLEAN
