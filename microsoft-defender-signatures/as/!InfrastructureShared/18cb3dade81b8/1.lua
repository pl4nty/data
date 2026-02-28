local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= "" then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L0_1 = L1_1.utf8p2
  end
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[6]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[6]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[6]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= "" then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[6]
        L0_1 = L1_1.utf8p2
      end
    end
  end
end
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1.command_line
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = IsExcludedByCmdlineMacOS
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = IsExcludedByImagePathMacOS
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_77
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_77::
L4_1 = is_valid_ip
L5_1 = L0_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = bm
  L4_1 = L4_1.trigger_sig
  L5_1 = "GenericReverseShell"
  L6_1 = L1_1
  L7_1 = L2_1.ppid
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = bm
  L4_1 = L4_1.trigger_sig
  L5_1 = "BmTraverseTreeBlockMac"
  L6_1 = "Detected"
  L4_1(L5_1, L6_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
