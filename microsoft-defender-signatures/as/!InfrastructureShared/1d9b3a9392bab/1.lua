local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
if L1_1 then
  L1_1 = bm_AddRelatedFileFromCommandLine
  L2_1 = L0_1.command_line
  L3_1 = nil
  L4_1 = nil
  L5_1 = 1
  L1_1(L2_1, L3_1, L4_1, L5_1)
  L1_1 = nil
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L1_1 = L2_1.utf8p2
    end
  end
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[6]
      L1_1 = L2_1.utf8p2
    end
  end
  if L1_1 ~= nil then
    L2_1 = bm_AddRelatedFileFromCommandLine
    L3_1 = L1_1
    L4_1 = nil
    L5_1 = nil
    L6_1 = 1
    L2_1(L3_1, L4_1, L5_1, L6_1)
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
