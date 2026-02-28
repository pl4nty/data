local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "DestIp=([^;]+)"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = IsHostAttackServer
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = nil
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L3_1 = L3_1.utf8p2
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[2]
        L2_1 = L3_1.utf8p2
      end
    end
    if L2_1 ~= nil then
      L3_1 = bm
      L3_1 = L3_1.request_SMS
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L4_1 = L4_1.ppid
      L5_1 = "L"
      L3_1(L4_1, L5_1)
      L3_1 = bm
      L3_1 = L3_1.trigger_sig
      L4_1 = "active_attacker_server_connection_a"
      L5_1 = L0_1
      L6_1 = this_sigattrlog
      L6_1 = L6_1[2]
      L6_1 = L6_1.ppid
      L3_1(L4_1, L5_1, L6_1)
      L3_1 = TrackPidAndTechniqueBM
      L4_1 = "BM"
      L5_1 = "T1020"
      L6_1 = "active_attacker_server_connection_a"
      L3_1(L4_1, L5_1, L6_1)
      L3_1 = bm_AddRelatedFileFromCommandLine
      L4_1 = L2_1
      L5_1 = nil
      L6_1 = nil
      L7_1 = 1
      L3_1(L4_1, L5_1, L6_1, L7_1)
      L3_1 = bm
      L3_1 = L3_1.set_detection_string
      L4_1 = "AttackerServer:"
      L5_1 = L1_1
      L4_1 = L4_1 .. L5_1
      L3_1(L4_1)
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
