local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
if L0_1 == "odbcconf.exe" or L0_1 == "explorer.exe" then
  L1_1 = mp
  L1_1 = L1_1.getfilesize
  L1_1 = L1_1()
  if L1_1 <= 4096 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = tostring
    L3_1 = headerpage
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
    L3_1 = L1_1
    L2_1 = L1_1.gmatch
    L4_1 = "regsvr%s+([%a%d\\.]*)"
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = 5
    L4_1 = 0
    L5_1 = mp
    L5_1 = L5_1.getfilename
    L6_1 = mp
    L6_1 = L6_1.bitor
    L7_1 = mp
    L7_1 = L7_1.FILEPATH_QUERY_PATH
    L8_1 = mp
    L8_1 = L8_1.FILEPATH_QUERY_LOWERCASE
    L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L6_1(L7_1, L8_1)
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
    L6_1 = normalize_path
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    L5_1 = L6_1
    L6_1 = L2_1
    L7_1 = nil
    L8_1 = nil
    for L9_1 in L6_1, L7_1, L8_1 do
      L10_1 = L5_1
      L11_1 = "\\"
      L12_1 = L9_1
      L10_1 = L10_1 .. L11_1 .. L12_1
      L11_1 = "DllFromRsp"
      L12_1 = MpCommon
      L12_1 = L12_1.QueryPersistContext
      L13_1 = L10_1
      L14_1 = L11_1
      L12_1 = L12_1(L13_1, L14_1)
      if not L12_1 then
        L13_1 = MpCommon
        L13_1 = L13_1.AppendPersistContext
        L14_1 = L10_1
        L15_1 = L11_1
        L16_1 = 100
        L13_1(L14_1, L15_1, L16_1)
        L4_1 = L4_1 + 1
      end
      if L3_1 <= L4_1 then
        break
      end
    end
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
