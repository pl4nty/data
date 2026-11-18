-- Threat: !InfrastructureShared
-- Name: !#Lua:Win32/FileExports.A
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

if peattributes.no_exports then
  if peattributes.isdll then
    mp.set_mpattribute("Lua:Context/FileExportCount.A!0")
  end
  return mp.CLEAN
end
if not peattributes.isdll then
  mp.set_mpattribute("Lua:Win32/ExeFileWithExport.A")
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = "Lua:Context/FileExportCount.A!" .. tostring(l_0_0)
mp.set_mpattribute(l_0_2)
if l_0_0 <= 3 then
  mp.set_mpattribute("Lua:Context/FileExportCountLTE!3")
end
if l_0_0 <= 6 then
  mp.set_mpattribute("Lua:Context/FileExportCountLTE!6")
end
if l_0_0 <= 10 then
  mp.set_mpattribute("Lua:Context/FileExportCountLTE!10")
end
if 10 <= l_0_0 then
  mp.set_mpattribute("Lua:Context/FileExportCountGTE!10")
end
if 20 <= l_0_0 then
  mp.set_mpattribute("Lua:Context/FileExportCountGTE!20")
end
if 50 <= l_0_0 then
  mp.set_mpattribute("Lua:Context/FileExportCountGTE!50")
end
if 4 < l_0_0 then
  return mp.CLEAN
end
local l_0_3 = "Lua:Win32/FileExports.A!"
for l_0_4 = 1, l_0_0 do
  local l_0_5 = pe.mmap_string_rva(l_0_1[l_0_4].namerva, 64)
  if l_0_5 ~= nil then
    l_0_5 = string.lower(l_0_5)
    mp.set_mpattribute(l_0_3 .. l_0_5)
  end
end
return mp.CLEAN
