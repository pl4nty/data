local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = {}
L2_1["svchost.exe"] = true
L2_1["ccsvchst.exe"] = true
L3_1 = L2_1[L1_1]
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L3_1["cmd.exe"] = true
L3_1["powershell.exe"] = true
L4_1 = {}
L4_1["cscript.exe"] = true
L4_1["wscript.exe"] = true
L5_1 = {}
L5_1["mshta.exe"] = true
L5_1["rundll32.exe"] = true
L5_1["regasm.exe"] = true
L5_1["regsvc.exe"] = true
L5_1["regsvr32.exe"] = true
L5_1["msbuild.exe"] = true
L5_1["certutil.exe"] = true
L5_1["installutil.exe"] = true
L6_1 = false
L7_1 = nil
L8_1 = L3_1[L1_1]
if L8_1 == true then
  L6_1 = true
  L7_1 = 3289195922
else
  L8_1 = L4_1[L1_1]
  if L8_1 == true then
    L6_1 = true
    L7_1 = 1560572968
  else
    L8_1 = L5_1[L1_1]
    if L8_1 == true then
      L6_1 = true
      L7_1 = 704857278
    end
  end
end
if L6_1 == false or L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.getfilename
L8_1 = L8_1()
L9_1 = MpCommon
L9_1 = L9_1.QueryPersistContext
L10_1 = L8_1
L11_1 = "DroppedByBitsadmin"
L9_1 = L9_1(L10_1, L11_1)
if not L9_1 then
  L9_1 = MpCommon
  L9_1 = L9_1.QueryPersistContext
  L10_1 = L8_1
  L11_1 = "DroppedByBITS"
  L9_1 = L9_1(L10_1, L11_1)
  if not L9_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
end
L9_1 = getAgePrev
L10_1 = true
L9_1, L10_1 = L9_1(L10_1)
L11_1 = false
if not (-1 < L9_1) and not (-1 < L10_1) then
  L12_1 = mp
  L12_1 = L12_1.get_mpattribute
  L13_1 = "agePrevQueried"
  L12_1 = L12_1(L13_1)
  if not L12_1 then
    L12_1 = mp
    L12_1 = L12_1.get_mpattribute
    L13_1 = "BM_BlockedForBITS"
    L12_1 = L12_1(L13_1)
    if not L12_1 then
      L12_1 = MpCommon
      L12_1 = L12_1.QueryPersistContext
      L13_1 = L8_1
      L14_1 = "agePrevQueried"
      L12_1 = L12_1(L13_1, L14_1)
      if not L12_1 then
        L12_1 = MpCommon
        L12_1 = L12_1.QueryPersistContext
        L13_1 = L8_1
        L14_1 = "BM_BlockedForBITS"
        L12_1 = L12_1(L13_1, L14_1)
        if not L12_1 then
          goto lbl_137
        end
      end
    end
  end
end
L11_1 = true
::lbl_137::
if L11_1 == true then
  L12_1 = mp
  L12_1 = L12_1.get_mpattribute
  L13_1 = "MpDisableCaching"
  L12_1 = L12_1(L13_1)
  if L12_1 then
    L12_1 = mp
    L12_1 = L12_1.clear_mpattribute
    L13_1 = "MpDisableCaching"
    L12_1(L13_1)
  end
  L12_1 = mp
  L12_1 = L12_1.get_mpattribute
  L13_1 = "queryAgePrev"
  L12_1 = L12_1(L13_1)
  if L12_1 then
    L12_1 = mp
    L12_1 = L12_1.clear_mpattribute
    L13_1 = "queryAgePrev"
    L12_1(L13_1)
  end
  L12_1 = clearPersistContext
  L13_1 = L8_1
  L14_1 = "queryAgePrev"
  L12_1(L13_1, L14_1)
  L12_1 = mp
  L12_1 = L12_1.get_mpattribute
  L13_1 = "disableCachingQueryAgePrev"
  L12_1 = L12_1(L13_1)
  if L12_1 then
    L12_1 = mp
    L12_1 = L12_1.clear_mpattribute
    L13_1 = "disableCachingQueryAgePrev"
    L12_1(L13_1)
  end
  L12_1 = clearPersistContext
  L13_1 = L8_1
  L14_1 = "disableCachingQueryAgePrev"
  L12_1(L13_1, L14_1)
end
if L9_1 == -1 and L10_1 == -1 and L11_1 == false then
  L12_1 = mp
  L12_1 = L12_1.IsTrustedFile
  L13_1 = false
  L12_1 = L12_1(L13_1)
  if L12_1 == true then
    L12_1 = mp
    L12_1 = L12_1.CLEAN
    return L12_1
  end
  L12_1 = MpCommon
  L12_1 = L12_1.QueryPersistContext
  L13_1 = L8_1
  L14_1 = "BM_AgePrevLookedUpForBITS"
  L12_1 = L12_1(L13_1, L14_1)
  if not L12_1 then
    L12_1 = MpCommon
    L12_1 = L12_1.AppendPersistContext
    L13_1 = L8_1
    L14_1 = "BM_AgePrevLookedUpForBITS"
    L15_1 = 0
    L12_1(L13_1, L14_1, L15_1)
  end
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "BM_AgePrevLookedUpForBITS"
  L12_1(L13_1)
  L12_1 = mp
  L12_1 = L12_1.get_mpattribute
  L13_1 = "disableCachingQueryAgePrev"
  L12_1 = L12_1(L13_1)
  if not L12_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "disableCachingQueryAgePrev"
    L12_1(L13_1)
  end
  L12_1 = MpCommon
  L12_1 = L12_1.QueryPersistContext
  L13_1 = L8_1
  L14_1 = "disableCachingQueryAgePrev"
  L12_1 = L12_1(L13_1, L14_1)
  if not L12_1 then
    L12_1 = MpCommon
    L12_1 = L12_1.AppendPersistContext
    L13_1 = L8_1
    L14_1 = "disableCachingQueryAgePrev"
    L15_1 = 0
    L12_1(L13_1, L14_1, L15_1)
  end
elseif -1 < L9_1 and L9_1 <= 1 and -1 < L10_1 and L10_1 <= 100 then
  L12_1 = MpCommon
  L12_1 = L12_1.QueryPersistContext
  L13_1 = L8_1
  L14_1 = "BM_BlockedForBITS"
  L12_1 = L12_1(L13_1, L14_1)
  if not L12_1 then
    L12_1 = MpCommon
    L12_1 = L12_1.AppendPersistContext
    L13_1 = L8_1
    L14_1 = "BM_BlockedForBITS"
    L15_1 = 0
    L12_1(L13_1, L14_1, L15_1)
  end
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "BM_BlockedForBITS"
  L12_1(L13_1)
  L12_1 = mp
  L12_1 = L12_1.INFECTED
  return L12_1
else
  L12_1 = mp
  L12_1 = L12_1.ReportLowfi
  L13_1 = L8_1
  L14_1 = L7_1
  L12_1(L13_1, L14_1)
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
