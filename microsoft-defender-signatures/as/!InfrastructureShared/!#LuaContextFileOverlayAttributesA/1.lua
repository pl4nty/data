local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Exception:FileOverlayAttributes"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.ispackedwith
  L1_1 = "AutoIt+"
  L0_1 = L0_1(L1_1)
  if L0_1 ~= true then
    L0_1 = mp
    L0_1 = L0_1.get_mpattributesubstring
    L1_1 = "Win32/AutoIt"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattributesubstring
      L1_1 = "PESTATIC:cleanstub_autoitv"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        goto lbl_28
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_28::
L0_1 = pehdr
if L0_1 ~= nil then
  L0_1 = pehdr
  L0_1 = L0_1.ImageBase
  if L0_1 ~= nil then
    L0_1 = pehdr
    L0_1 = L0_1.NumberOfSections
    if L0_1 ~= nil then
      goto lbl_42
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_42::
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.PointerToRawData
L1_1 = pesecs
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.SizeOfRawData
L0_1 = L0_1 + L1_1
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L0_1 == nil or L1_1 == nil or L0_1 >= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1 - L0_1
if L2_1 <= 4096 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if 4096 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT0x1000"
  L3_1(L4_1)
end
if 12288 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT0x3000"
  L3_1(L4_1)
end
if 20480 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT0x5000"
  L3_1(L4_1)
end
if 65536 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT0x10000"
  L3_1(L4_1)
end
if 131072 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT0x20000"
  L3_1(L4_1)
end
if 327680 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT0x50000"
  L3_1(L4_1)
end
if 1048576 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT1MB"
  L3_1(L4_1)
end
if 2097152 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT2MB"
  L3_1(L4_1)
end
if 5242880 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT5MB"
  L3_1(L4_1)
end
if 10485760 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT10MB"
  L3_1(L4_1)
end
if 20971520 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT20MB"
  L3_1(L4_1)
end
if 104857600 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/FileOverlayGT100MB"
  L3_1(L4_1)
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
