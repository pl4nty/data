local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = next
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = bm
    L1_1 = L1_1.add_related_string
    L2_1 = "[->] MEDICATED COMMAND LINE: "
    L3_1 = L0_1.command_line
    L4_1 = bm
    L4_1 = L4_1.RelatedStringBMReport
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = pcallEx
    L2_1 = "triggerMemoryScanOnProcessTree"
    L3_1 = triggerMemoryScanOnProcessTree
    L4_1 = false
    L5_1 = true
    L6_1 = "SMS_H"
    L7_1 = 5000
    L8_1 = "Behavior:Win32/CobaltStrike.MK!sms"
    L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
