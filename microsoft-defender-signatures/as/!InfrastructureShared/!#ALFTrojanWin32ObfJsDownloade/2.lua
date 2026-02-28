local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.getfilename
    L1_1 = mp
    L1_1 = L1_1.bitor
    L2_1 = mp
    L2_1 = L2_1.FILEPATH_QUERY_FULL
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
    L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1, L3_1)
    L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    L1_1 = MpCommon
    L1_1 = L1_1.QueryPersistContext
    L2_1 = L0_1
    L3_1 = "isErik"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.bitor
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_FNAME
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_PATH
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1, L4_1)
    L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    L3_1 = #L2_1
    if not (L3_1 < 4) then
      L3_1 = #L2_1
      if not (8 < L3_1) then
        goto lbl_61
      end
    end
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    do return L3_1 end
    ::lbl_61::
    L3_1 = "programdata\\{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}$"
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L1_1
    L6_1 = L3_1
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = {}
    L4_1["wscript.exe"] = true
    L4_1["cscript.exe"] = true
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = mp
    L6_1 = L6_1.get_contextdata
    L7_1 = mp
    L7_1 = L7_1.CONTEXT_DATA_PROCESSNAME
    L6_1, L7_1 = L6_1(L7_1)
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L6_1 = L4_1[L5_1]
      if L6_1 then
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
