local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.getfilename
    L1_1 = mp
    L1_1 = L1_1.bitor
    L2_1 = mp
    L2_1 = L2_1.FILEPATH_QUERY_FNAME
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
    L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
    L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
    if L0_1 == "reg.exe" then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.FILEPATH_QUERY_LOWERCASE
    L1_1 = L1_1(L2_1)
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L1_1
    L4_1 = 0
    L5_1 = 4
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 == "\\\\?\\" then
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L1_1
      L4_1 = 5
      L2_1 = L2_1(L3_1, L4_1)
      L1_1 = L2_1
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
    L2_1 = MpCommon
    L2_1 = L2_1.QueryPersistContext
    L3_1 = L1_1
    L4_1 = "RenamedRegExe"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L3_1 = MpCommon
      L3_1 = L3_1.AppendPersistContext
      L4_1 = L1_1
      L5_1 = "RenamedRegExe"
      L6_1 = 0
      L3_1(L4_1, L5_1, L6_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
