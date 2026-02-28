local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "PACKED_WITH:[CMDEmbedded]"
L1_1 = L1_1(L2_1)
if L1_1 and L0_1 < 1048576 then
  L1_1 = nil
  if L0_1 <= 4096 then
    L2_1 = tostring
    L3_1 = headerpage
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
  else
    L2_1 = mp
    L2_1 = L2_1.readprotection
    L3_1 = false
    L2_1(L3_1)
    L2_1 = mp
    L2_1 = L2_1.readfile
    L3_1 = 0
    L4_1 = mp
    L4_1 = L4_1.getfilesize
    L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1()
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    L1_1 = L2_1
  end
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "regsvr32[.%a]*%s+([%a%d\\.]*)"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == nil then
    L4_1 = L1_1
    L3_1 = L1_1.match
    L5_1 = "rundll32[.%a]*%s+([%a%d\\.]*)"
    L3_1 = L3_1(L4_1, L5_1)
    L2_1 = L3_1
  end
  if L2_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.getfilename
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
    L3_1 = L3_1(L4_1)
    L5_1 = L3_1
    L4_1 = L3_1.match
    L6_1 = "(.*)\\"
    L4_1 = L4_1(L5_1, L6_1)
    L5_1 = "\\"
    L6_1 = L2_1
    L3_1 = L4_1 .. L5_1 .. L6_1
    L4_1 = normalize_path
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    L4_1 = "DllLoadedViaLnk"
    L5_1 = MpCommon
    L5_1 = L5_1.QueryPersistContext
    L6_1 = L3_1
    L7_1 = L4_1
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      L6_1 = MpCommon
      L6_1 = L6_1.AppendPersistContext
      L7_1 = L3_1
      L8_1 = L4_1
      L9_1 = 100
      L6_1(L7_1, L8_1, L9_1)
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
