local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = {}
L0_1["c:\\windows\\inf"] = "inf"
L0_1["c:\\windows\\help"] = "help"
L0_1["c:\\windows\\debug"] = "debug"
L0_1["c:\\windows\\media"] = "media"
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1 = L1_1(L2_1)
L2_1 = L1_1
L1_1 = L1_1.lower
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if 8 < L2_1 then
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
      L3_1 = L2_1
      L2_1 = L2_1.lower
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
    end
    L2_1 = L0_1[L1_1]
    L3_1 = L0_1[L1_1]
    if L3_1 ~= nil then
      L3_1 = "FileDropBySuspectedVatet_"
      L4_1 = "Lua:Context/SuspectedVatet!"
      L5_1 = L3_1
      L6_1 = L2_1
      L5_1 = L5_1 .. L6_1
      L6_1 = L4_1
      L7_1 = L2_1
      L6_1 = L6_1 .. L7_1
      L7_1 = MpCommon
      L7_1 = L7_1.QueryPersistContext
      L8_1 = L1_1
      L9_1 = L5_1
      L7_1 = L7_1(L8_1, L9_1)
      if not L7_1 then
        L8_1 = MpCommon
        L8_1 = L8_1.AppendPersistContext
        L9_1 = L1_1
        L10_1 = L5_1
        L11_1 = 1000
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
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
