local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = L1_1.command_line
  L3_1 = L1_1.ppid
  if L2_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L6_1 = L4_1
  L5_1 = L4_1.find
  L7_1 = "powershell.exe"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = L4_1.find
    L6_1 = "pwsh.exe"
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      goto lbl_45
    end
  end
  L6_1 = L4_1
  L5_1 = L4_1.match
  L7_1 = "%s+[%-/]en?c?o?d?e?d?c?o?m?m?a?n?d?%s+"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = TrackPidAndTechniqueBM
    L6_1 = L3_1
    L7_1 = "T1059.001"
    L8_1 = "powershell-enc"
    L5_1(L6_1, L7_1, L8_1)
  end
  ::lbl_45::
  L5_1 = TrackPidAndTechniqueBM
  L6_1 = L3_1
  L7_1 = "T1555"
  L8_1 = "rdpcreddiscovery"
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
