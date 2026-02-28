local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = L0_1.image_path
    if L1_1 ~= nil then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = L0_1.ppid
if L1_1 then
  L1_1 = L0_1.command_line
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.command_line
    L1_1 = L1_1(L2_1)
    L3_1 = L1_1
    L2_1 = L1_1.gmatch
    L4_1 = "(https?://[^%s]+)"
    L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
    for L5_1 in L2_1, L3_1, L4_1 do
      L6_1 = IsHostAttackServerCloudChk
      L7_1 = L5_1
      L8_1 = "Behavior:Win32/XferFromAttackerServer.A"
      L9_1 = L0_1.image_path
      L10_1 = L0_1.command_line
      L11_1 = "UrlInCmdline"
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
      if L6_1 then
        L6_1 = TrackPidAndTechniqueBM
        L7_1 = L0_1.ppid
        L8_1 = "T1057"
        L9_1 = "xfer_from_attackerserver_a"
        L6_1(L7_1, L8_1, L9_1)
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
