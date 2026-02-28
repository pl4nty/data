local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 100000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_connection_string
L0_1 = L0_1()
if L0_1 then
  L1_1 = bm
  L1_1 = L1_1.get_current_process_startup_info
  L1_1 = L1_1()
  if L1_1 ~= nil then
    L2_1 = L1_1.command_line
    if L2_1 ~= nil then
      L2_1 = L1_1.image_path
      if L2_1 ~= nil then
        goto lbl_28
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_28::
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L0_1
  L4_1 = "DestIp=([^;]+)"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = IsHostAttackServerCloudChk
  L4_1 = L2_1
  L5_1 = "Behavior:Win32/ActiveConnToAttackerServer.I"
  L6_1 = L1_1.image_path
  L7_1 = L1_1.command_line
  L8_1 = "ActiveConnToAttackerServer"
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  if L3_1 then
    L3_1 = TrackPidAndTechniqueBM
    L4_1 = "BM"
    L5_1 = "T1020"
    L6_1 = "active_attacker_server_connection_i;attacksvr:"
    L7_1 = L2_1
    L6_1 = L6_1 .. L7_1
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
