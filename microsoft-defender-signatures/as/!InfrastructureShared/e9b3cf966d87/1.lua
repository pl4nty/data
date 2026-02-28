local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p1
  L2_1 = L2_1(L3_1)
  L3_1 = "services\\(.*)\\\\group"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 or not L0_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\ServiceGroupOrder"
  L3_1 = sysio
  L3_1 = L3_1.RegOpenKey
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = sysio
    L4_1 = L4_1.GetRegValueAsMultiString
    L5_1 = L3_1
    L6_1 = "List"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L5_1 = next
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if L5_1 then
        goto lbl_48
      end
    end
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    do return L5_1 end
    ::lbl_48::
    L5_1 = ""
    L6_1 = ipairs
    L7_1 = L4_1
    L6_1, L7_1, L8_1 = L6_1(L7_1)
    for L9_1, L10_1 in L6_1, L7_1, L8_1 do
      L11_1 = L5_1
      L12_1 = L10_1
      L13_1 = "|"
      L5_1 = L11_1 .. L12_1 .. L13_1
    end
    L6_1 = L0_1
    L7_1 = "(.-)|Filter|"
    L6_1 = L6_1 .. L7_1
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L5_1
    L9_1 = L6_1
    L10_1 = 1
    L11_1 = false
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    if L7_1 then
      L7_1 = SetPersistContextNoPath
      L8_1 = "NewServiceRegistered_LoadsBeforeEdr_"
      L9_1 = L1_1
      L8_1 = L8_1 .. L9_1
      L9_1 = "true"
      L7_1 = L7_1(L8_1, L9_1)
      L8_1 = SetPersistContextNoPath
      L9_1 = "NewServiceRegistered_LoadsBeforeAV_"
      L10_1 = L1_1
      L9_1 = L9_1 .. L10_1
      L10_1 = "true"
      L8_1 = L8_1(L9_1, L10_1)
      if not L7_1 or not L8_1 then
        L9_1 = bm
        L9_1 = L9_1.add_related_string
        L10_1 = "Error setting PersistContext"
        L11_1 = "EDR:"
        L12_1 = tostring
        L13_1 = L7_1
        L12_1 = L12_1(L13_1)
        L13_1 = ";AV:"
        L14_1 = tostring
        L15_1 = L8_1
        L14_1 = L14_1(L15_1)
        L11_1 = L11_1 .. L12_1 .. L13_1 .. L14_1
        L12_1 = bm
        L12_1 = L12_1.RelatedStringBMReport
        L9_1(L10_1, L11_1, L12_1)
        L9_1 = mp
        L9_1 = L9_1.INFECTED
        return L9_1
      end
    else
      L7_1 = SetPersistContextNoPath
      L8_1 = "NewServiceRegistered_LoadsBeforeAV_"
      L9_1 = L1_1
      L8_1 = L8_1 .. L9_1
      L9_1 = "true"
      L7_1 = L7_1(L8_1, L9_1)
      if not L7_1 then
        L8_1 = bm
        L8_1 = L8_1.add_related_string
        L9_1 = "Error setting PersistContext"
        L10_1 = "AV:false"
        L11_1 = bm
        L11_1 = L11_1.RelatedStringBMReport
        L8_1(L9_1, L10_1, L11_1)
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    end
  end
  L4_1 = QueryPersistContextNoPath
  L5_1 = "SymLinkCreatedForMDE_EDR"
  L6_1 = "true"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = "SymlinkForEDRExists"
    L6_1 = "True"
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  L4_1 = QueryPersistContextNoPath
  L5_1 = "SymLinkCreatedForMDE_AV"
  L6_1 = "true"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = "SymlinkForAVExists"
    L6_1 = "True"
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
