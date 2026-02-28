local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpContentDetected"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattributesubstring
  L1_1 = "Detection:Trojan:Win"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattributesubstring
    L1_1 = "Detection:HackTool:Win"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattributesubstring
      L1_1 = "Detection:RemoteAccess:Win"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.CLEAN
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = 0
L4_1 = 4
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == "\\\\?\\" then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = 5
  L1_1 = L1_1(L2_1, L3_1)
  L0_1 = L1_1
end
L2_1 = L0_1
L1_1 = L0_1.sub
L3_1 = 1
L4_1 = 8
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == "\\device\\" then
  L1_1 = MpCommon
  L1_1 = L1_1.PathToWin32Path
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
  if L0_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "^c:\\windows\\%w+%.exe$"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "NewWrittenBySystemProcessDetected"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.AppendPersistContext
  L3_1 = L0_1
  L4_1 = "NewWrittenBySystemProcessDetected"
  L5_1 = 5
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
