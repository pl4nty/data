local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "PACKED_WITH:[CMDEmbedded]"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.UfsGetMetadataBool
L1_1 = "Lua:PowerShellInLnk"
L2_1 = true
L0_1, L1_1 = L0_1(L1_1, L2_1)
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCRIPT:PowerShell"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "SCRIPT:EncodedCommand"
  L2_1 = L2_1(L3_1)
end
if not L2_1 and (L0_1 ~= 0 or not L1_1) then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L2_1 < 100 or 4000 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = tostring
L4_1 = headerpage
L3_1 = L3_1(L4_1)
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "-[Ee][nN]*[cC]*%a*%s+[\"']*([%w+/]+=?=?)"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.vfo_add_buffer
L8_1 = MpCommon
L8_1 = L8_1.Base64Decode
L9_1 = L6_1
L8_1 = L8_1(L9_1)
L9_1 = "[PSEncodedCommand]"
L10_1 = mp
L10_1 = L10_1.ADD_VFO_TAKE_ACTION_ON_DAD
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
