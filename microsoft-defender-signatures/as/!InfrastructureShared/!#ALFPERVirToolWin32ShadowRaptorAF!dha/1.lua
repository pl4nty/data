-- Threat: !InfrastructureShared
-- Name: !#ALFPER:VirTool:Win32/ShadowRaptor.AF!dha
-- Type: 12

if mp.readu_u16(headerpage, 1) == 23117 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 65536 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.bitxor(mp.readu_u32(headerpage, 1), 3688618971)
if l_0_1 == 0 then
  return mp.CLEAN
end
if mp.bitxor(mp.readu_u32(headerpage, 5), l_0_1) == 2305 and mp.bitxor(mp.readu_u32(headerpage, 9), l_0_1) == 1801666816 and mp.bitxor(mp.readu_u32(headerpage, 13), l_0_1) == 1836216134 then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
