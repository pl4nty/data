local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "CMN:HSTR:InstallerFile"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Exception:FileResourceAttributes"
  L0_1 = L0_1(L1_1)
  if L0_1 ~= true then
    goto lbl_16
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil then
    return
  end
  L1_2 = 1
  L2_2 = pehdr
  L2_2 = L2_2.NumberOfSections
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = tostring
    L6_2 = pesecs
    L6_2 = L6_2[L4_2]
    L6_2 = L6_2.Name
    L5_2 = L5_2(L6_2)
    if L5_2 == A0_2 then
      L5_2 = pesecs
      L5_2 = L5_2[L4_2]
      L5_2 = L5_2.PointerToRawData
      L6_2 = pesecs
      L6_2 = L6_2[L4_2]
      L6_2 = L6_2.SizeOfRawData
      return L5_2, L6_2
    end
  end
end

L1_1 = pehdr
if L1_1 ~= nil then
  L1_1 = pehdr
  L1_1 = L1_1.ImageBase
  if L1_1 ~= nil then
    goto lbl_27
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_27::
L1_1 = L0_1
L2_1 = ".rsrc"
L1_1, L2_1 = L1_1(L2_1)
if L1_1 == nil or L2_1 == nil or L2_1 <= 4096 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if 4096 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileResouceGT0x1000"
  L3_1(L4_1)
end
if 12288 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileResouceGT0x3000"
  L3_1(L4_1)
end
if 20480 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileResouceGT0x5000"
  L3_1(L4_1)
end
if 65536 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileResouceGT0x10000"
  L3_1(L4_1)
end
if 131072 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileResouceGT0x20000"
  L3_1(L4_1)
end
if 327680 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileResouceGT0x50000"
  L3_1(L4_1)
end
if 1048576 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileResouceGT1MB"
  L3_1(L4_1)
end
if 2097152 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileResouceGT2MB"
  L3_1(L4_1)
end
L3_1 = pehdr
L3_1 = L3_1.SizeOfCode
if L2_1 > L3_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:Context/ResourceSizeGreaterThanSizeOfCode"
  L4_1(L5_1)
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
