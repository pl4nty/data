local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpNewlyCreatedHint"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "MpInternal_IsPliScan"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "MpIsSENSEScan"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Exception:EmbeddedPEFile.A"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "EmbeddedPE32GUIHdr"
  L0_1 = L0_1(L1_1)
  if L0_1 ~= true then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "EmbeddedPE32PlusGUIHdr"
    L0_1 = L0_1(L1_1)
    if L0_1 ~= true then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "CMN:HSTR:InstallerFile"
      L0_1 = L0_1(L1_1)
      if L0_1 ~= true then
        goto lbl_49
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_49::
L0_1 = pehdr
if L0_1 ~= nil then
  L0_1 = pehdr
  L0_1 = L0_1.ImageBase
  if L0_1 ~= nil then
    L0_1 = pehdr
    L0_1 = L0_1.NumberOfSections
    if L0_1 ~= nil then
      L0_1 = pesecs
      if L0_1 ~= nil then
        goto lbl_66
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_66::
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.VirtualAddress
L1_1 = pehdr
L1_1 = L1_1.ImageBase
L0_1 = L0_1 + L1_1
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L2_1 = pehdr
L2_1 = L2_1.ImageBase
L3_1 = pesecs
L3_1 = L3_1[L1_1]
L3_1 = L3_1.VirtualAddress
L2_1 = L2_1 + L3_1
L3_1 = pesecs
L3_1 = L3_1[L1_1]
L3_1 = L3_1.VirtualSize
L2_1 = L2_1 + L3_1
if L0_1 ~= nil then
  L3_1 = pehdr
  L3_1 = L3_1.ImageBase
  if not (L0_1 <= L3_1 or L2_1 == nil or L0_1 >= L2_1) then
    goto lbl_97
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_97::
L3_1 = L2_1 - L0_1
if L3_1 <= 5376 or 5242880 <= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = "This program cannot be run in DOS mode.\144\002\255PE\144\000"
L5_1 = pe
L5_1 = L5_1.vm_search
L6_1 = L0_1
L7_1 = L2_1
L8_1 = L4_1
L9_1 = nil
L10_1 = pe
L10_1 = L10_1.VM_SEARCH_BM
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
if L5_1 ~= 4294967295 then
  L6_1 = peattributes
  L6_1 = L6_1.isdll
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/EmbeddedPEFile.A!dll"
    L6_1(L7_1)
  else
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/EmbeddedPEFile.A!exe"
    L6_1(L7_1)
  end
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
