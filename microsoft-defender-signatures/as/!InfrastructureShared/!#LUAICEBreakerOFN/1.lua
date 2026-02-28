local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "SLF:Backdoor:Win32/FrostByte"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "Lua:PeProductName!icebreaker"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = MpCommon
L1_1 = L1_1.SetOriginalFileName
L2_1 = L0_1
L3_1 = "BM_ICEBreaker"
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
