local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = L1_1.command_line
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "powershell"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = L3_1.find
    L5_1 = "pwsh"
    L6_1 = 1
    L7_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if not L4_1 then
      goto lbl_46
    end
  end
  L5_1 = L3_1
  L4_1 = L3_1.match
  L6_1 = "%s+[%-/]en?c?o?d?e?d?c?o?m?m?a?n?d?%s+"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = TrackPidAndTechniqueBM
    L5_1 = "BM"
    L6_1 = "T1071.001"
    L7_1 = "posh_webaccess_enc"
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
::lbl_46::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
