local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[16]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[16]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[16]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= "" then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[16]
      L0_1 = L0_1.utf8p2
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
          goto lbl_51
        end
      end
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      do return L4_1 end
      ::lbl_51::
      L5_1 = L0_1
      L4_1 = L0_1.find
      L6_1 = "with hidden answer"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
