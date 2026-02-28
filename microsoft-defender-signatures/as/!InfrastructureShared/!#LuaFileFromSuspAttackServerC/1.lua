local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_REMOTE_SESSION_IP
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 and L1_1 and L1_1 ~= "" then
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.getfilename
  L4_1 = mp
  L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
  L3_1 = L3_1(L4_1)
  if not L3_1 or L3_1 == "" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L5_1 = L3_1
  L4_1 = L3_1.sub
  L6_1 = 1
  L7_1 = 8
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 == "\\device\\" then
    L4_1 = MpCommon
    L4_1 = L4_1.PathToWin32Path
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    if L3_1 then
      L5_1 = L3_1
      L4_1 = L3_1.lower
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
    else
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
  L4_1 = TrackPidAndTechnique
  L5_1 = L2_1
  L6_1 = "T1057"
  L7_1 = "remotesrcip_"
  L8_1 = L1_1
  L7_1 = L7_1 .. L8_1
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = false
  L5_1 = mp
  L5_1 = L5_1.get_mpattribute
  L6_1 = "Lua:CloudBlockLevelGT3"
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = IsHostAttackServerCloudChk
    L6_1 = L1_1
    L7_1 = "Lua:FileFromSuspAttackServer.C"
    L8_1 = "System"
    L9_1 = "System"
    L10_1 = "SMBDrop"
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
    L4_1 = L5_1
  else
    L5_1 = IsHostAttackServer
    L6_1 = L1_1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
  end
  if L4_1 then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Lua:FileFromAttackerServer"
    L5_1(L6_1)
    L5_1 = string
    L5_1 = L5_1.format
    L6_1 = "scenario:smbdrop_from_attackerserver;filepath:%s;attacksvr:%s"
    L7_1 = L3_1
    L8_1 = L1_1
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L6_1 = TT_SendBMSigTrigger
    L7_1 = L2_1
    L8_1 = "file_from_attackerserver"
    L9_1 = L5_1
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
