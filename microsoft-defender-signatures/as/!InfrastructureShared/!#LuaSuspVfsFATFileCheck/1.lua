local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = false
L1_1 = false
L2_1 = ""
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = headerpage
L5_1 = 44
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 1397311045 then
  L3_1 = mp
  L3_1 = L3_1.readu_u32
  L4_1 = headerpage
  L5_1 = 55
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == 827605318 then
    L3_1 = mp
    L3_1 = L3_1.readu_u16
    L4_1 = headerpage
    L5_1 = 58
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 == 12849 then
      L1_1 = true
      L2_1 = "FAT12"
    elseif L3_1 == 13873 then
      L1_1 = true
      L2_1 = "FAT16"
    else
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "BM_VirtualFS_FAT_UNKNOWN"
      L4_1(L5_1)
      L4_1 = tostring
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      L2_1 = L4_1
    end
  else
    L3_1 = mp
    L3_1 = L3_1.readu_u32
    L4_1 = headerpage
    L5_1 = 83
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 == 861159750 then
      L3_1 = mp
      L3_1 = L3_1.readu_u16
      L4_1 = headerpage
      L5_1 = 86
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 == 12851 then
        L1_1 = true
        L2_1 = "FAT32"
      else
        L4_1 = mp
        L4_1 = L4_1.set_mpattribute
        L5_1 = "BM_VirtualFS_FAT_UNKNOWN"
        L4_1(L5_1)
        L4_1 = tostring
        L5_1 = L3_1
        L4_1 = L4_1(L5_1)
        L2_1 = L4_1
      end
    end
  end
end
if L1_1 and L2_1 ~= "" then
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
  L3_1 = L3_1(L4_1)
  if L3_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    L4_1 = {}
    L4_1["vmware.exe"] = true
    L4_1["vmplayer.exe"] = true
    L5_1 = L4_1[L3_1]
    if L5_1 then
      L0_1 = true
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:FATCommonProcExcl"
      L5_1(L6_1)
    end
  end
  L4_1 = mp
  L4_1 = L4_1.getfilename
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
  L4_1 = L4_1(L5_1)
  if L4_1 ~= nil then
    L5_1 = #L4_1
    if 4 < L5_1 then
      L5_1 = string
      L5_1 = L5_1.sub
      L6_1 = L4_1
      L7_1 = -4
      L5_1 = L5_1(L6_1, L7_1)
      if L5_1 == ".flp" then
        L0_1 = true
        L5_1 = mp
        L5_1 = L5_1.set_mpattribute
        L6_1 = "Lua:FATCommonFileNameExcl"
        L5_1(L6_1)
      end
    end
  end
  if not L0_1 then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "BM_VirtualFS_"
    L7_1 = L2_1
    L6_1 = L6_1 .. L7_1
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
