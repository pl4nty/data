local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = tostring
L1_1 = headerpage
L0_1 = L0_1(L1_1)
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L0_1 = L0_1 .. L1_1
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = nil
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "<conditions>.*publishername=\"(.-)\".*</conditions>"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.match
L4_1 = L0_1
L5_1 = "<conditions>.*path=\"(.-)\".*</conditions>"
L3_1 = L3_1(L4_1, L5_1)
L2_1 = L3_1
if L2_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "program files\\windows defender\\"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "\\windows defender advanced threat protection"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      goto lbl_46
    end
  end
  L1_1 = true
end
::lbl_46::
L3_1 = string
L3_1 = L3_1.match
L4_1 = L0_1
L5_1 = "<conditions>.*binaryname=\"(.-)\".*</conditions>"
L3_1 = L3_1(L4_1, L5_1)
L2_1 = L3_1
if L2_1 then
  L3_1 = isMDEBlockingPolicy
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L1_1 = true
  end
end
if not L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FULL
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = AppendToRollingQueue
L5_1 = "RQ_RecentAppLockerPolicyFileDropped"
L6_1 = L3_1
L7_1 = L2_1
L8_1 = 86400
L9_1 = 50
L10_1 = 1
L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
