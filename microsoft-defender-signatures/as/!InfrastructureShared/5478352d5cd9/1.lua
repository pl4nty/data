-- Threat: !InfrastructureShared
-- Name: 5478352d5cd9
-- Type: 21

if not peattributes.isdll or pehdr.TimeDateStamp ~= 0 or pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT].RVA == 0 or pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT].Size < 9 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = pe.mmap_rva(pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT].RVA, 9)
local l_0_1 = mp.readu_u32(l_0_0, 5)
if l_0_1 == 4294967295 then
  return mp.INFECTED
end
return mp.CLEAN
