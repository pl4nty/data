local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = {}
L0_1["?getwindowinfos@@yajxz"] = true
L0_1.generatekey = true
L0_1.generatekeyw = true
L0_1.memloadfunc = true
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 1048576 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pe
L2_1 = L2_1.get_exports
L2_1, L3_1 = L2_1()
L4_1 = 0
if L2_1 ~= 4 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = 1
L6_1 = L2_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = pe
  L9_1 = L9_1.mmap_string_rva
  L10_1 = L3_1[L8_1]
  L10_1 = L10_1.namerva
  L11_1 = 64
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 ~= nil then
    L10_1 = string
    L10_1 = L10_1.lower
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    L10_1 = L0_1[L10_1]
    if L10_1 then
      L4_1 = L4_1 + 1
    end
  end
end
if L4_1 == 4 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
