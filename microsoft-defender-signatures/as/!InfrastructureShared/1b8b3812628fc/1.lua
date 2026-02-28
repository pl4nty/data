local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
L3_1 = 0
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[6]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[6]
  L5_1 = L5_1.utf8p1
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[6]
    L5_1 = L5_1.np2
    if L5_1 ~= nil then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[6]
      L4_1 = L5_1.utf8p1
      L5_1 = this_sigattrlog
      L5_1 = L5_1[6]
      L3_1 = L5_1.np2
    end
  end
end
L5_1 = tonumber
L6_1 = tostring
L7_1 = L3_1
L6_1 = L6_1(L7_1)
L7_1 = 8
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.bsplit
L7_1 = L5_1
L8_1 = 3
L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
if L6_1 == 0 and L7_1 == 0 and L8_1 == 0 and L9_1 == 0 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
if L4_1 == "" or L4_1 == nil then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = mp
L10_1 = L10_1.bitand
L11_1 = L6_1
L12_1 = 1
L10_1 = L10_1(L11_1, L12_1)
if L10_1 ~= 1 then
  L10_1 = mp
  L10_1 = L10_1.bitand
  L11_1 = L7_1
  L12_1 = 1
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 ~= 1 then
    L10_1 = mp
    L10_1 = L10_1.bitand
    L11_1 = L8_1
    L12_1 = 1
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 ~= 1 then
      goto lbl_121
    end
  end
end
L10_1 = sysio
L10_1 = L10_1.IsFileExists
L11_1 = L4_1
L10_1 = L10_1(L11_1)
if L10_1 then
  L10_1 = bm
  L10_1 = L10_1.add_threat_file
  L11_1 = L4_1
  L10_1(L11_1)
end
L10_1 = mp
L10_1 = L10_1.INFECTED
do return L10_1 end
::lbl_121::
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
