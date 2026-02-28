local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = peattributes
L0_1 = L0_1.no_exports
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isdll
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "Lua:Context/FileExportCount.A!0"
    L0_1(L1_1)
  end
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isdll
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "Lua:Win32/ExeFileWithExport.A"
  L0_1(L1_1)
end
L0_1 = pe
L0_1 = L0_1.get_exports
L0_1, L1_1 = L0_1()
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "Lua:Context/FileExportCount.A!"
L3_1 = tostring
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L2_1 = L2_1 .. L3_1
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = L2_1
L3_1(L4_1)
if L0_1 <= 3 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileExportCountLTE!3"
  L3_1(L4_1)
end
if L0_1 <= 6 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileExportCountLTE!6"
  L3_1(L4_1)
end
if L0_1 <= 10 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileExportCountLTE!10"
  L3_1(L4_1)
end
if 10 <= L0_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileExportCountGTE!10"
  L3_1(L4_1)
end
if 20 <= L0_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileExportCountGTE!20"
  L3_1(L4_1)
end
if 50 <= L0_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileExportCountGTE!50"
  L3_1(L4_1)
end
if 4 < L0_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "Lua:Win32/FileExports.A!"
L4_1 = 1
L5_1 = L0_1
L6_1 = 1
for L7_1 = L4_1, L5_1, L6_1 do
  L8_1 = pe
  L8_1 = L8_1.mmap_string_rva
  L9_1 = L1_1[L7_1]
  L9_1 = L9_1.namerva
  L10_1 = 64
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= nil then
    L9_1 = string
    L9_1 = L9_1.lower
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    L8_1 = L9_1
    L9_1 = mp
    L9_1 = L9_1.set_mpattribute
    L10_1 = L3_1
    L11_1 = L8_1
    L10_1 = L10_1 .. L11_1
    L9_1(L10_1)
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
