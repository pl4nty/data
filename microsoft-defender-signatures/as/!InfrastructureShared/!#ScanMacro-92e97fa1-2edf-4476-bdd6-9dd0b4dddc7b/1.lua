local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "BM_OFFICE_FILE"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
else
  L2_1 = nil
  L3_1 = nil
  L4_1 = string
  L4_1 = L4_1.len
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  if 5 <= L4_1 then
    L4_1 = string
    L4_1 = L4_1.sub
    L5_1 = L1_1
    L6_1 = -4
    L4_1 = L4_1(L5_1, L6_1)
    L2_1 = L4_1
  end
  L4_1 = string
  L4_1 = L4_1.len
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  if 20 <= L4_1 then
    L4_1 = string
    L4_1 = L4_1.sub
    L5_1 = L1_1
    L6_1 = -14
    L4_1 = L4_1(L5_1, L6_1)
    L3_1 = L4_1
  end
  if L2_1 ~= ".xls" and L2_1 ~= ".doc" and L3_1 ~= "vbaproject.bin" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_CNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "SCRIPT:LoadWin32importsfromMacro"
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.get_mpattribute
  L4_1 = "MHSTR:LoadWin32importsfromMacro"
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.QueryPersistContext
    L4_1 = L2_1
    L5_1 = "enghipscpy:MHSTRLoadWin32importsfromMacroInside"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
end
L3_1 = GetCtxOfficeProc
L3_1 = L3_1()
if L3_1 ~= "productivity" and L3_1 ~= "productivity2" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = mp
L5_1 = L5_1.getfilename
L6_1 = mp
L6_1 = L6_1.bitor
L7_1 = mp
L7_1 = L7_1.FILEPATH_QUERY_FULL
L8_1 = mp
L8_1 = L8_1.FILEPATH_QUERY_LOWERCASE
L6_1, L7_1, L8_1, L9_1, L10_1 = L6_1(L7_1, L8_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
L6_1 = ">%[msilres"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "LUA:InsideMSILRES"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = false
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L2_1
L5_1 = L5_1(L6_1)
L2_1 = L5_1
if L2_1 ~= nil and L2_1 ~= "" then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L2_1 = L5_1
  L5_1 = sysio
  L5_1 = L5_1.IsFileExists
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L4_1 = true
  end
end
if L4_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\program files\\microsoft office\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\program files (x86)\\microsoft office\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\program files\\windowsapps\\microsoft.office.desktop.excel"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\program files (x86)\\windowsapps\\microsoft.office.desktop.excel"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.IsPathExcludedForHipsRule
  L6_1 = L2_1
  L7_1 = "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = versioning
  L5_1 = L5_1.GetEngineRing
  L5_1 = L5_1()
  L6_1 = versioning
  L6_1 = L6_1.GetOrgID
  L6_1 = L6_1()
  if L6_1 ~= nil and L6_1 ~= "" then
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    L6_1 = L7_1
  end
  if L5_1 ~= nil then
    L7_1 = versioning
    L7_1 = L7_1.ENGINE_RING_3_STAGED
  end
  if L5_1 < L7_1 or L6_1 == "5e2bb82e-51b0-4ee9-9e90-fa7cb6d1db48" or L6_1 == "ba11743e-6a8f-4599-93fb-2425110e2a75" then
    L7_1 = mp
    L7_1 = L7_1.getfilename
    L8_1 = mp
    L8_1 = L8_1.FILEPATH_QUERY_FULL
    L7_1 = L7_1(L8_1)
    if L7_1 ~= nil and L7_1 ~= "" then
      L8_1 = MpCommon
      L8_1 = L8_1.PathToWin32Path
      L9_1 = L7_1
      L8_1 = L8_1(L9_1)
      L7_1 = L8_1
      if L7_1 ~= nil and L7_1 ~= "" then
        L8_1 = mp
        L8_1 = L8_1.IsPathExcludedForHipsRule
        L9_1 = L7_1
        L10_1 = "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b"
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
        end
      end
    end
  end
end
L5_1 = nil
L6_1 = GetInvolvedFileInCmdLnIfExistOnMachine
L6_1 = L6_1()
L5_1 = L6_1
if L5_1 ~= nil then
  L6_1 = mp
  L6_1 = L6_1.IsPathExcludedForHipsRule
  L7_1 = L5_1
  L8_1 = "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "MpDisableCaching"
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.SetHipsRule
L7_1 = "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b"
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.BLOCKACCESS
return L6_1
