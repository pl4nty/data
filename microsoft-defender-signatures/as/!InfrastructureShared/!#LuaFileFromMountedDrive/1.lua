local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 4) then
    goto lbl_18
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_18::
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -4
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= ".lnk" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = MpCommon
L2_1 = L2_1.GetMountedFileBackingFilePath
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetMotwZoneForFile
L4_1 = L2_1
L3_1, L4_1 = L3_1(L4_1)
if L4_1 ~= nil and 3 <= L4_1 then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:LnkFromMountedVolumeWithMotw"
  L5_1(L6_1)
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = string
  L6_1 = L6_1.sub
  L7_1 = L2_1
  L8_1 = -4
  L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L1_1 = L5_1
  if L1_1 == ".iso" then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Lua:LnkFromMountedIsoWithMotw"
    L5_1(L6_1)
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
