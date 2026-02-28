local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.ppid
if L1_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1.ppid
  L3_1 = "pid:4$"
  L4_1 = 1
  L5_1 = false
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1.ppid
    L3_1 = "pid:4,"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      goto lbl_28
    end
  end
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_28::
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = GetFileName
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "wmiprvse.exe"
L5_1 = "wsmprovhost.exe"
L6_1 = "winrshost.exe"
L7_1 = "psexesvc.exe"
L8_1 = "sshd.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L4_1 = contains
L5_1 = L2_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
