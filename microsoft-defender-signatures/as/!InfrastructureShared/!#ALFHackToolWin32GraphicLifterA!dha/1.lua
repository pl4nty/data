-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/GraphicLifter.A!dha
-- Type: 11
-- MpAttributes: Lua:ExecuteSingleExportDLL.A & RPF:TopLevelFile & BM_UnsignedDll & LUA:FileSizeGT40000.A & LUA:FileSizeLE80000.A & HSTR:PossibleVcEpStub & MpNewlyCreatedHint & pea_32bitmachine

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 307200 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pe.get_exports()
if l_0_2 == nil or l_0_2[1].namerva == nil or l_0_2[1].rva == nil then
  return mp.CLEAN
end
local l_0_3 = pe.mmap_string_rva(l_0_2[1].namerva, 8)
if l_0_3 == nil or l_0_3 ~= "Printer" then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_4 = mp.readfile(pe.foffset_rva(l_0_2[1].rva), 9)
mp.readprotection(true)
if l_0_4 == nil or l_0_4 ~= "U\139\236\129\236\016\001\000\000" then
  return mp.CLEAN
end
return mp.INFECTED
