local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
if L1_1 then
  L1_1 = L0_1.image_path
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.image_path
    L1_1 = L1_1(L2_1)
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "\\program files"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = bm_AddRelatedFileFromCommandLine
    L3_1 = L0_1.command_line
    L4_1 = nil
    L5_1 = nil
    L6_1 = 1
    L2_1(L3_1, L4_1, L5_1, L6_1)
    L2_1 = triggerMemoryScanOnProcessTree
    L3_1 = true
    L4_1 = true
    L5_1 = "SMS_H"
    L6_1 = 5000
    L7_1 = "Behavior:Win32/MsilAmsiTamper.A"
    L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
    L2_1 = add_parents
    L2_1()
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
