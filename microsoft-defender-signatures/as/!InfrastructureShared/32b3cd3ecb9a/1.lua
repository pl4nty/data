local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
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
L1_1 = sysio
L1_1 = L1_1.GetPEVersionInfo
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = L1_1.OriginalFilename
  if L2_1 then
    goto lbl_26
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_26::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.OriginalFilename
L2_1 = L2_1(L3_1)
if L2_1 ~= "werfaultsecure.exe" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = sysio
L2_1 = L2_1.GetPEFixedVersionInfo
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = crypto
L3_1 = L3_1.shr64
L4_1 = L2_1.FileVersion
L5_1 = 48
L3_1 = L3_1(L4_1, L5_1)
if 10 <= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = bm
L4_1 = L4_1.add_related_string
L5_1 = "OriginalFileName_PeParser"
L6_1 = Version_to_str
L7_1 = L2_1.FileVersion
L6_1 = L6_1(L7_1)
L7_1 = bm
L7_1 = L7_1.RelatedStringBMReport
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
