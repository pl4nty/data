local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.IOAVGetDownloadUrl
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
  L1_1 = mp
  L1_1 = L1_1.IOAVGetProcessId
  L1_1 = L1_1()
  if not L1_1 then
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
  L4_1 = L2_1
  L3_1 = L2_1.sub
  L5_1 = 1
  L6_1 = 8
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == "\\device\\" then
    L3_1 = MpCommon
    L3_1 = L3_1.PathToWin32Path
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L4_1 = L3_1
    L3_1 = L3_1.lower
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
  end
  L3_1 = TrackPidAndTechnique
  L4_1 = L1_1
  L5_1 = "T1057"
  L6_1 = "ioavurl_"
  L7_1 = L0_1
  L6_1 = L6_1 .. L7_1
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = false
  L4_1 = mp
  L4_1 = L4_1.get_mpattribute
  L5_1 = "Lua:CloudBlockLevelGT3"
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.IOAVGetProcessPath
    L4_1 = L4_1()
    if L4_1 == nil or L4_1 == "" then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = mp
    L5_1 = L5_1.GetProcessCommandLine
    L6_1 = L1_1
    L5_1 = L5_1(L6_1)
    if L5_1 == nil or L5_1 == "" then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = IsHostAttackServerCloudChk
    L7_1 = L0_1
    L8_1 = "Lua:FileFromSuspAttackServer.B"
    L9_1 = L4_1
    L10_1 = L5_1
    L11_1 = "IOAV"
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
    L3_1 = L6_1
  else
    L4_1 = IsHostAttackServer
    L5_1 = L0_1
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
    L5_1 = "scenario:has_ioav_attackerurl;filepath:%s;attacksvr:%s"
    L6_1 = L2_1
    L7_1 = L0_1
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    L5_1 = TT_SendBMSigTrigger
    L6_1 = L1_1
    L7_1 = "file_from_attackerserver"
    L8_1 = L4_1
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
