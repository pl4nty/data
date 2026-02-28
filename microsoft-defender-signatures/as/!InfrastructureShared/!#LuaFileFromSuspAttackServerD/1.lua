local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESS_PPID
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L2_1
L5_1 = 1
L6_1 = 12
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == "\\device\\mup\\" then
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "\\sysvol\\"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "\\netlogon\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      goto lbl_60
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_60::
  L3_1 = MpCommon
  L3_1 = L3_1.PathToWin32Path
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L4_1 = L3_1
  L3_1 = L3_1.lower
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = TrackPidAndTechnique
  L4_1 = L0_1
  L5_1 = "T1057"
  L6_1 = "remoteshare_"
  L7_1 = L2_1
  L6_1 = L6_1 .. L7_1
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = false
  L4_1 = mp
  L4_1 = L4_1.get_mpattribute
  L5_1 = "Lua:CloudBlockLevelGT3"
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.GetProcessCommandLine
    L5_1 = L0_1
    L4_1 = L4_1(L5_1)
    if L4_1 == nil or L4_1 == "" then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = IsHostAttackServerCloudChk
    L6_1 = L2_1
    L7_1 = "Lua:FileFromSuspAttackServer.D"
    L8_1 = L1_1
    L9_1 = L4_1
    L10_1 = "SMBShare"
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
    L3_1 = L5_1
  else
    L4_1 = IsHostAttackServer
    L5_1 = L2_1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
  end
  if L3_1 then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:FileFromAttackerServer"
    L4_1(L5_1)
    L4_1 = string
    L4_1 = L4_1.format
    L5_1 = "scenario:open_from_attackershare;filepath:%s;attacksvr:%s"
    L6_1 = L2_1
    L7_1 = L2_1
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    L5_1 = TT_SendBMSigTrigger
    L6_1 = L0_1
    L7_1 = "file_from_attackerserver"
    L8_1 = L4_1
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
