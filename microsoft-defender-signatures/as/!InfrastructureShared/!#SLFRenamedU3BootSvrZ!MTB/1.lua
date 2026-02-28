local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
if not L0_1 or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if not L0_1 or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".exe"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = "\\program files"
L3_1 = "\\program files (x86)"
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = "\\programdata\\"
L4_1 = "\\users\\"
L5_1 = "\\windows\\temp\\"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.GetOriginalFileName
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if not L3_1 or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L0_1
L6_1 = "[^\\]+$"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = ""
end
if L3_1 and L3_1 ~= "" and L4_1 ~= "" then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L4_1
  L6_1 = L6_1(L7_1)
  if L5_1 == "u3boostsvr.exe" and L6_1 ~= L5_1 then
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
