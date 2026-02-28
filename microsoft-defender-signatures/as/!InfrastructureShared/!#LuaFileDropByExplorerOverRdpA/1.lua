local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 ~= "explorer.exe" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESS_PPID
L1_1 = L1_1(L2_1)
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
L3_1 = pcall
L4_1 = MpCommon
L4_1 = L4_1.QuerySessionInformation
L5_1 = L1_1
L6_1 = MpCommon
L6_1 = L6_1.WTSIsRemoteSession
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
if not L3_1 or not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = pcall
L6_1 = MpCommon
L6_1 = L6_1.QuerySessionInformation
L7_1 = L1_1
L8_1 = MpCommon
L8_1 = L8_1.WTSClientAddress
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L6_1(L7_1, L8_1)
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if L5_1 ~= nil and L6_1 ~= nil then
  L7_1 = L6_1.Address
  if L7_1 ~= nil then
    L7_1 = false
    L8_1 = mp
    L8_1 = L8_1.get_mpattribute
    L9_1 = "Lua:CloudBlockLevelGT3"
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.GetProcessCommandLine
      L9_1 = L1_1
      L8_1 = L8_1(L9_1)
      if L8_1 == nil or L8_1 == "" then
        L9_1 = mp
        L9_1 = L9_1.CLEAN
        return L9_1
      end
      L9_1 = IsHostAttackServerCloudChk
      L10_1 = L6_1.Address
      L11_1 = "Lua:FileDropByExplorerOverRdp.A"
      L12_1 = L0_1
      L13_1 = L8_1
      L14_1 = "RDPFileDrop"
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
      L7_1 = L9_1
    else
      L8_1 = IsHostAttackServer
      L9_1 = L6_1.Address
      L8_1 = L8_1(L9_1)
      L7_1 = L8_1
    end
    if L7_1 then
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = "Lua:FileFromAttackerServer"
      L8_1(L9_1)
      L8_1 = string
      L8_1 = L8_1.format
      L9_1 = "scenario:rdp_from_attackerserver;filepath:%s;attacksvr:%s"
      L10_1 = L2_1
      L11_1 = tostring
      L12_1 = L6_1.Address
      L11_1, L12_1, L13_1, L14_1 = L11_1(L12_1)
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
      L9_1 = TT_SendBMSigTrigger
      L10_1 = L1_1
      L11_1 = "T1021.001"
      L12_1 = L8_1
      L9_1(L10_1, L11_1, L12_1)
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    end
  end
end
L7_1 = TrackPidAndTechnique
L8_1 = L1_1
L9_1 = "T1021.001"
L10_1 = "is_remote_desktop_connection"
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.IsHipsRuleEnabled
L8_1 = "d1e49aac-8f56-4280-b9ba-993a6d77406c"
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = mp
  L7_1 = L7_1.IsHipsRuleEnabled
  L8_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    L7_1 = mp
    L7_1 = L7_1.get_mpattribute
    L8_1 = "Lua:TT:DetectionThresholdMet"
    L7_1 = L7_1(L8_1)
    if not L7_1 then
      goto lbl_153
    end
  end
end
L7_1 = mp
L7_1 = L7_1.INFECTED
do return L7_1 end
::lbl_153::
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
