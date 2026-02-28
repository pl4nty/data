local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = L1_1.command_line
L4_1 = IsExcludedByCmdlineMacOS
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = IsExcludedByImagePathMacOS
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_21
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_21::
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
      L0_1 = L4_1.utf8p2
      L4_1 = SuspMacPathsToMonitor
      L5_1 = L0_1
      L6_1 = true
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
