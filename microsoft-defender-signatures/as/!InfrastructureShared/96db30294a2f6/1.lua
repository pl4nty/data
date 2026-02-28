local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = L0_1.command_line
    if L1_1 ~= "" then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = L0_1.command_line
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "/elfsigner.py"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "--no_disclaimer"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    goto lbl_37
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_37::
L2_1 = 50000000
L3_1 = bm
L3_1 = L3_1.GetSignatureMatchDuration
L3_1 = L3_1()
if L2_1 < L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1486"
L6_1 = "Impact_Encryption"
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
