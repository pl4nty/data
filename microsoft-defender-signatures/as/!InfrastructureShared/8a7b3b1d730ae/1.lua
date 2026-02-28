local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_35
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_35::
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[3]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[3]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L3_1 = L4_1.utf8p2
  end
end
else
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L3_1 ~= nil and L3_1 ~= "" then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "/private/tmp/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    goto lbl_92
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "/Users/Shared/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    goto lbl_92
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "/Library/Caches/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    goto lbl_92
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_92::
L4_1 = sysio
L4_1 = L4_1.IsFileExists
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = bm
  L4_1 = L4_1.add_threat_file
  L5_1 = L3_1
  L4_1(L5_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
