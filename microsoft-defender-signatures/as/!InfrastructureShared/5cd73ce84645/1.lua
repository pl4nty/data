local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.image_path
  if not L1_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = MpCommon
  L3_1 = L3_1.PathToWin32Path
  L4_1 = L1_1
  L3_1, L4_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1)
  L1_1 = L2_1
  L2_1 = StringSplit
  L3_1 = L1_1
  L4_1 = "\\"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = #L2_1
  if L3_1 < 7 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = {}
  L3_1["cmd.exe"] = true
  L3_1["powershell.exe"] = true
  L4_1 = #L2_1
  L4_1 = L2_1[L4_1]
  L4_1 = L3_1[L4_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
