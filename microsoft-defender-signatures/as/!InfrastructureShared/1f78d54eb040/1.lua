-- Threat: !InfrastructureShared
-- Name: 1f78d54eb040
-- Type: 21
-- Flags: 1

local l_0_0 = pe.mmap_va(pehdr.AddressOfEntryPoint + pehdr.ImageBase, 4)
local l_0_1 = string.byte(l_0_0, 1)
local l_0_2 = string.byte(l_0_0, 2)
local l_0_3 = string.byte(l_0_0, 3)
local l_0_4 = string.byte(l_0_0, 4)
if opclog[1].address == pehdr.AddressOfEntryPoint + pehdr.ImageBase and l_0_1 == 226 and l_0_2 == 254 and l_0_3 == 106 and l_0_4 == 0 and not peattributes.packed and not peattributes.hasstandardentry then
  mp.changedetectionname(268436398)
  return mp.INFECTED
end
return mp.SUSPICIOUS
