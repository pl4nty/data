-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaWin32FileExportsA\0x00001aac_luac 

-- params : ...
-- function num : 0
if peattributes.no_exports then
  if peattributes.isdll then
    (mp.set_mpattribute)("Lua:Context/FileExportCount.A!0")
  end
  return mp.CLEAN
end
if not peattributes.isdll then
  (mp.set_mpattribute)("Lua:Win32/ExeFileWithExport.A")
end
local l_0_0, l_0_1 = (pe.get_exports)()
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = "Lua:Context/FileExportCount.A!" .. tostring(l_0_0)
;
(mp.set_mpattribute)(l_0_2)
if l_0_0 <= 3 then
  (mp.set_mpattribute)("Lua:Context/FileExportCountLTE!3")
end
if l_0_0 <= 6 then
  (mp.set_mpattribute)("Lua:Context/FileExportCountLTE!6")
end
if l_0_0 <= 10 then
  (mp.set_mpattribute)("Lua:Context/FileExportCountLTE!10")
end
if l_0_0 >= 10 then
  (mp.set_mpattribute)("Lua:Context/FileExportCountGTE!10")
end
if l_0_0 >= 20 then
  (mp.set_mpattribute)("Lua:Context/FileExportCountGTE!20")
end
if l_0_0 >= 50 then
  (mp.set_mpattribute)("Lua:Context/FileExportCountGTE!50")
end
if l_0_0 > 4 then
  return mp.CLEAN
end
local l_0_3 = "Lua:Win32/FileExports.A!"
for l_0_7 = 1, l_0_0 do
  local l_0_8 = (pe.mmap_string_rva)((l_0_1[l_0_7]).namerva, 64)
  if l_0_8 ~= nil then
    l_0_8 = (string.lower)(l_0_8)
    ;
    (mp.set_mpattribute)(l_0_3 .. l_0_8)
  end
end
return mp.CLEAN

