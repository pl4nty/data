local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
    goto lbl_135
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
L1_1 = L1_1(L2_1)
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_FILEPATH
  L1_1 = L1_1(L2_1)
  L2_1 = L1_1
  L1_1 = L1_1.lower
  L1_1 = L1_1(L2_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L3_1 = L1_1
  L2_1 = L1_1.sub
  L4_1 = 1
  L5_1 = 8
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 == "\\device\\" then
    L2_1 = MpCommon
    L2_1 = L2_1.PathToWin32Path
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
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
  end
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
  L2_1 = L2_1(L3_1)
  L4_1 = L2_1
  L3_1 = L2_1.sub
  L5_1 = 1
  L6_1 = 8
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == "\\device\\" then
    L3_1 = MpCommon
    L3_1 = L3_1.PathToWin32Path
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    if L2_1 == nil then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
  end
  L3_1 = {}
  L3_1["c:\\windows\\system32"] = "sysdir"
  L3_1["c:\\windows"] = "windir"
  L3_1["c:\\users\\public"] = "public"
  L3_1["c:\\programdata"] = "programdata"
  L3_1["c:\\perflogs"] = "perflogs"
  L4_1 = L3_1[L1_1]
  if L4_1 ~= nil then
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_PROCESS_ID
    L4_1 = L4_1(L5_1)
    if L4_1 < 12 then
      L4_1 = L3_1[L1_1]
      L5_1 = "SuspFileDroppedBySystemProcessC_"
      L6_1 = L4_1
      L5_1 = L5_1 .. L6_1
      L6_1 = "Lua:Context/SuspFileDropBySystemProc.C!"
      L7_1 = L4_1
      L6_1 = L6_1 .. L7_1
      L7_1 = mp
      L7_1 = L7_1.get_mpattribute
      L8_1 = "BM_MZ_FILE"
      L7_1 = L7_1(L8_1)
      if L7_1 then
        L7_1 = "SuspExeFileDroppedBySystemProcessC_"
        L8_1 = L4_1
        L5_1 = L7_1 .. L8_1
        L7_1 = "Lua:Context/SuspExeFileDropBySystemProc.C!"
        L8_1 = L4_1
        L6_1 = L7_1 .. L8_1
      end
      L7_1 = MpCommon
      L7_1 = L7_1.QueryPersistContext
      L8_1 = L2_1
      L9_1 = L5_1
      L7_1 = L7_1(L8_1, L9_1)
      if not L7_1 then
        L8_1 = MpCommon
        L8_1 = L8_1.AppendPersistContext
        L9_1 = L2_1
        L10_1 = L5_1
        L11_1 = 100
        L8_1(L9_1, L10_1, L11_1)
      end
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = L6_1
      L8_1(L9_1)
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
::lbl_135::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
