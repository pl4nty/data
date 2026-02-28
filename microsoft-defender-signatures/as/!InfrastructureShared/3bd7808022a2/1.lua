local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = "-r "
L4_1 = ".js"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = containsall
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L1_1
L4_1 = L4_1(L5_1)
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = sysio
L3_1 = L3_1.GetPEVersionInfo
L4_1 = L0_1.image_path
L3_1 = L3_1(L4_1)
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = isnull
  L5_1 = L3_1.OriginalFilename
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_67
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_67::
L4_1 = {}
L4_1["node.exe"] = true
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L3_1.OriginalFilename
L5_1 = L5_1(L6_1)
L5_1 = L4_1[L5_1]
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
