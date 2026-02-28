local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = contains
  L3_1 = L1_1
  L4_1 = "TiWorker"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
end
else
  L2_1 = {}
  L3_1 = {}
  L4_1 = ""
  L5_1 = "TiWorker"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L4_1 = {}
  L5_1 = "TiWorker.exe"
  L6_1 = ""
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L2_1[1] = L3_1
  L2_1[2] = L4_1
  L3_1 = checkParentCmdlineCaseInsensitive
  L4_1 = L0_1.ppid
  L5_1 = L2_1
  L6_1 = 5
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[6]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = this_sigattrlog
  L3_1 = L3_1[6]
  L3_1 = L3_1.p1
  L4_1 = "Windows-SenseClient-FoD-Package"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
