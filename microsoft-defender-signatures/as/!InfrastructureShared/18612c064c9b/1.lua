-- Threat: !InfrastructureShared
-- Name: 18612c064c9b
-- Type: 21

local l_0_0 = pe.foffset_va(hstrlog[1].VA)
local l_0_1 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_IMPORT].RVA
local l_0_2 = pe.mmap_rva(l_0_1 + 12, 4)
local l_0_3 = string.byte(l_0_2, 1) + string.byte(l_0_2, 2) * 256 + string.byte(l_0_2, 3) * 65536 + string.byte(l_0_2, 4) * 16777216
local l_0_4 = pe.foffset_rva(l_0_3)
if l_0_0 > l_0_4 and l_0_0 - l_0_4 < 48 then
  return mp.INFECTED
end
return mp.CLEAN
