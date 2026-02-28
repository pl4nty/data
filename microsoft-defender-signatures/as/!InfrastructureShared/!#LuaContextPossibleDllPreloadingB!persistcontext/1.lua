local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
    L0_1 = {}
    L0_1.BM_FaceFodUninstaller_EXE = "facefoduninstaller.exe"
    L0_1.BM_POWERSHELL_EXE = "powershell.exe"
    L0_1.BM_RUNDLL32_EXE = "rundll32.exe"
    L0_1.BM_OSK_EXE = "osk.exe"
    L1_1 = nil
    L2_1 = nil
    L3_1 = pairs
    L4_1 = L0_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = mp
      L8_1 = L8_1.get_mpattribute
      L9_1 = L6_1
      L8_1 = L8_1(L9_1)
      if L8_1 then
        L1_1 = L6_1
        L2_1 = L7_1
        break
      end
    end
    if L1_1 == nil or L2_1 == nil then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_FILENAME
    L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L4_1(L5_1)
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
    if L3_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = #L2_1
    if 0 < L4_1 then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = L2_1
      L4_1 = L4_1(L5_1)
      if L4_1 == L3_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
    end
    L4_1 = mp
    L4_1 = L4_1.getfilename
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
    L4_1 = L4_1(L5_1)
    L5_1 = normalize_path
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    L5_1 = L4_1
    L6_1 = "\\"
    L7_1 = L3_1
    L5_1 = L5_1 .. L6_1 .. L7_1
    L6_1 = MpCommon
    L6_1 = L6_1.QueryPersistContext
    L7_1 = L5_1
    L8_1 = L1_1
    L6_1 = L6_1(L7_1, L8_1)
    if not L6_1 then
      L7_1 = MpCommon
      L7_1 = L7_1.AppendPersistContext
      L8_1 = L5_1
      L9_1 = L1_1
      L10_1 = 100
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
