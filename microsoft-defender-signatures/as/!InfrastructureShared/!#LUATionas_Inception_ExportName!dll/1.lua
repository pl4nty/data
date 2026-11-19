-- Threat: !InfrastructureShared
-- Name: !#LUA:Tionas_Inception_ExportName!dll
-- Type: 9

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].Size == 0 then
  return mp.CLEAN
end
local l_0_0 = pehdr.DataDirectory[1].RVA
mp.readprotection(false)
local l_0_1 = mp.readfile(pe.foffset_rva(l_0_0), 36)
if mp.readu_u32(l_0_1, 21) ~= 2 then
  return mp.CLEAN
end
if mp.readu_u32(l_0_1, 25) ~= 2 then
  return mp.CLEAN
end
local l_0_2 = mp.readu_u32(l_0_1, 33)
l_0_1 = pe.mmap_rva(l_0_2, 4)
local l_0_3 = mp.readu_u32(l_0_1, 1)
local l_0_4 = pe.mmap_rva(l_0_3, 11)
if l_0_4 == "DllInstall\000" then
  return mp.INFECTED
end
return mp.CLEAN
