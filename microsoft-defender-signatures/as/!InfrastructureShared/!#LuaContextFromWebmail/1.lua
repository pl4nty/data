local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.IOAVGetDownloadUrl
L0_1 = L0_1()
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.len
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 12) then
    goto lbl_13
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_13::
L2_1 = L0_1
L1_1 = L0_1.lower
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "mail"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "outlook"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "message"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "attach"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        goto lbl_66
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "RPF:TopLevelFile"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.AppendPersistContextNoPath
  L3_1 = "CLF_AM"
  L4_1 = "CLF_AM_WM"
  L5_1 = 60
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = MpCommon
  L2_1 = L2_1.AppendPersistContextNoPath
  L3_1 = "CLF_IC"
  L4_1 = mp
  L4_1 = L4_1.getfilename
  L4_1 = L4_1()
  L5_1 = 60
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_66::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
