-- Threat: !InfrastructureShared
-- Name: 2789916b1483
-- Type: 21

if not mp.get_mpattribute("PEBMPAT:Virus:Win32/Xpaj.gen!F") then
  return mp.CLEAN
end
local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = mp.readu_u32(l_0_0, 3)
local l_0_2 = mp.readu_u32(l_0_0, 16)
local l_0_3 = string.format("CURE:Virus:Win32/Xpaj.C_%08X_%08X", l_0_1, l_0_2)
mp.set_mpattribute(l_0_3)
return mp.INFECTED
