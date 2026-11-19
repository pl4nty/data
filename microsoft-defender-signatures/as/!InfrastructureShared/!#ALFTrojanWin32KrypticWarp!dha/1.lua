-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/KrypticWarp!dha
-- Type: 8
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE

if pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT].Size < 9 then
  return mp.CLEAN
end
if pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT].RVA == 0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = pe.mmap_rva(pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT].RVA, 9)
local l_0_1 = mp.readu_u32(l_0_0, 5)
local l_0_2 = l_0_1 - pehdr.TimeDateStamp
if 233135995 < l_0_2 and l_0_2 < 233136005 then
  return mp.INFECTED
end
return mp.CLEAN
