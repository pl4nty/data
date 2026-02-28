local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.ppid
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = isnull
    L2_1 = L0_1.image_path
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      goto lbl_22
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_22::
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = isnull
  L3_1 = L1_1.ppid
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = isnull
    L3_1 = L1_1.image_path
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      goto lbl_44
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_44::
L2_1 = L1_1.image_path
L3_1 = L2_1
L2_1 = L2_1.match
L4_1 = "([^\\]+)$"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L3_1["services.exe"] = true
L3_1["svchost.exe"] = true
L3_1["hys9eas_epmsystem4.exe"] = true
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L4_1 = L3_1[L4_1]
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "backup"
L6_1 = "oracle"
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = contains
L6_1 = string
L6_1 = L6_1.lower
L7_1 = L2_1
L6_1 = L6_1(L7_1)
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
