local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
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
L1_1 = versioning
L1_1 = L1_1.GetOrgID
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = type
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 == "string" then
    goto lbl_30
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_30::
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L3_1 = L3_1(L4_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
L4_1 = L4_1(L5_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
L5_1 = L5_1(L6_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.lower
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L5_1 = L6_1
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_PROCESSDEVICEPATH
L6_1 = L6_1(L7_1)
if L6_1 == nil or L6_1 == "" then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = MpCommon
L7_1 = L7_1.PathToWin32Path
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = string
L8_1 = L8_1.lower
L9_1 = L7_1
L10_1 = "\\"
L11_1 = L5_1
L9_1 = L9_1 .. L10_1 .. L11_1
L8_1 = L8_1(L9_1)
L9_1 = string
L9_1 = L9_1.lower
L10_1 = L4_1
L11_1 = "\\"
L12_1 = L8_1
L10_1 = L10_1 .. L11_1 .. L12_1
L9_1 = L9_1(L10_1)
L10_1 = GetRqValueByKeyNS
L11_1 = "BAS_SB_Coverage"
L12_1 = "BAS_SB_OriginalProcs_Tel"
L13_1 = L9_1
L10_1 = L10_1(L11_1, L12_1, L13_1)
if not L10_1 then
  L10_1 = GetRqValueByKeyNS
  L11_1 = "BAS_SB_Coverage"
  L12_1 = "BAS_SB_OriginalExecFiles_Tel"
  L13_1 = L8_1
  L10_1 = L10_1(L11_1, L12_1, L13_1)
  if not L10_1 then
    if L5_1 ~= "sbsimulator.exe" then
      L10_1 = string
      L10_1 = L10_1.find
      L11_1 = L5_1
      L12_1 = "sbsimulation_sb_%d+_bs_%d+_gold%.exe"
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 == nil then
        L10_1 = string
        L10_1 = L10_1.find
        L11_1 = L5_1
        L12_1 = "sbsimulation_sb_%d+_bs_%d+_red%.exe"
        L10_1 = L10_1(L11_1, L12_1)
        if L10_1 == nil then
          L10_1 = string
          L10_1 = L10_1.find
          L11_1 = L5_1
          L12_1 = "sbsimulation_sb_%d+_bs_%d+_green%.exe"
          L10_1 = L10_1(L11_1, L12_1)
          if L10_1 == nil then
            goto lbl_208
          end
        end
      end
    end
    L10_1 = string
    L10_1 = L10_1.find
    L11_1 = L8_1
    L12_1 = "^[a-z]:\\program files\\safebreach\\"
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 == nil then
      goto lbl_208
    end
  end
end
L10_1 = AddRqKeyAndValueNS
L11_1 = "BAS_SB_Coverage"
L12_1 = "BAS_SB_OriginalProcs_Tel"
L13_1 = L9_1
L14_1 = "1"
L10_1(L11_1, L12_1, L13_1, L14_1)
L10_1 = AddRqKeyAndValueNS
L11_1 = "BAS_SB_Coverage"
L12_1 = "BAS_SB_RelatedNonExecFiles_Tel"
L13_1 = L3_1
L14_1 = "1"
L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
if L10_1 then
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = "MpDisableMOACSyncInsert"
  L10_1(L11_1)
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = "MpDisableCaching"
  L10_1(L11_1)
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  do return L10_1 end
  goto lbl_247
  ::lbl_208::
  L10_1 = GetRqValueByKeyNS
  L11_1 = "BAS_SB_Coverage"
  L12_1 = "BAS_SB_RelatedProcs_Tel"
  L13_1 = L9_1
  L10_1 = L10_1(L11_1, L12_1, L13_1)
  if not L10_1 then
    L10_1 = GetRqValueByKeyNS
    L11_1 = "BAS_SB_Coverage"
    L12_1 = "BAS_SB_RelatedExecFiles_Tel"
    L13_1 = L8_1
    L10_1 = L10_1(L11_1, L12_1, L13_1)
    if not L10_1 then
      goto lbl_247
    end
  end
  L10_1 = AddRqKeyAndValueNS
  L11_1 = "BAS_SB_Coverage"
  L12_1 = "BAS_SB_RelatedProcs_Tel"
  L13_1 = L9_1
  L14_1 = "1"
  L10_1(L11_1, L12_1, L13_1, L14_1)
  L10_1 = AddRqKeyAndValueNS
  L11_1 = "BAS_SB_Coverage"
  L12_1 = "BAS_SB_RelatedNonExecFiles_Tel"
  L13_1 = L3_1
  L14_1 = "1"
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 then
    L10_1 = mp
    L10_1 = L10_1.set_mpattribute
    L11_1 = "MpDisableMOACSyncInsert"
    L10_1(L11_1)
    L10_1 = mp
    L10_1 = L10_1.set_mpattribute
    L11_1 = "MpDisableCaching"
    L10_1(L11_1)
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
::lbl_247::
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
