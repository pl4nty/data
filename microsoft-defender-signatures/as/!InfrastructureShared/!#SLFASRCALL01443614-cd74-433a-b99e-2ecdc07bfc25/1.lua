local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
L1_1 = L1_1.IsHipsRuleEnabled
L2_1 = "01443614-cd74-433a-b99e-2ecdc07bfc25"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_parent_filehandle
L1_1 = L1_1()
L2_1 = mp
L2_1 = L2_1.is_handle_nil
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONOPEN
if L0_1 == L2_1 then
  L2_1 = {}
  L2_1["rundll32.exe"] = true
  L2_1["regsvr32.exe"] = true
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
  L3_1 = L3_1(L4_1)
  if L3_1 == nil or L3_1 == "" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L4_1 = L2_1[L4_1]
  if L4_1 == true then
    L4_1 = mp
    L4_1 = L4_1.get_mpattribute
    L5_1 = "MpDisableCaching"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.clear_mpattribute
      L5_1 = "MpDisableCaching"
      L4_1(L5_1)
    end
    L4_1 = mp
    L4_1 = L4_1.getfilename
    L5_1 = mp
    L5_1 = L5_1.bitor
    L6_1 = mp
    L6_1 = L6_1.FILEPATH_QUERY_FULL
    L7_1 = mp
    L7_1 = L7_1.FILEPATH_QUERY_LOWERCASE
    L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if L4_1 ~= nil and L4_1 ~= "" then
      L5_1 = string
      L5_1 = L5_1.lower
      L6_1 = MpCommon
      L6_1 = L6_1.PathToWin32Path
      L7_1 = L4_1
      L6_1, L7_1 = L6_1(L7_1)
      L5_1 = L5_1(L6_1, L7_1)
      L4_1 = L5_1
      L5_1 = mp
      L5_1 = L5_1.IsPathExcludedForHipsRule
      L6_1 = L4_1
      L7_1 = "01443614-cd74-433a-b99e-2ecdc07bfc25"
      L5_1 = L5_1(L6_1, L7_1)
      if L5_1 then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = ".:\\windows\\installer\\[^\\]+%.tmp$"
      L5_1 = L5_1(L6_1, L7_1)
      if L5_1 then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = ".:\\windows\\installer\\[^%.]+%.tmp%-\\installercustomactions%.dll$"
      L5_1 = L5_1(L6_1, L7_1)
      if L5_1 then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
    end
    L5_1 = mp
    L5_1 = L5_1.IsTrustedFile
    L6_1 = false
    L5_1, L6_1 = L5_1(L6_1)
    if L5_1 == false then
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
else
  L2_1 = mp
  L2_1 = L2_1.IsTrustedFile
  L3_1 = false
  L2_1, L3_1 = L2_1(L3_1)
  if L2_1 == false then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "MpDisableCaching"
    L4_1(L5_1)
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
