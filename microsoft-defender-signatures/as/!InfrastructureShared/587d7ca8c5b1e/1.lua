local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.hstr_full_log
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1[1]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = L0_1[2]
    L1_1 = L1_1.matched
    if not L1_1 then
      goto lbl_20
    end
  end
  L1_1 = set_research_data
  L2_1 = "TamperingCMD"
  L3_1 = "systemsettingsadminflows"
  L4_1 = false
  L1_1(L2_1, L3_1, L4_1)
  goto lbl_77
  ::lbl_20::
  L1_1 = L0_1[3]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = L0_1[4]
    L1_1 = L1_1.matched
    if not L1_1 then
      goto lbl_34
    end
  end
  L1_1 = set_research_data
  L2_1 = "TamperingCMD"
  L3_1 = "DisableRealtimeMonitoring"
  L4_1 = false
  L1_1(L2_1, L3_1, L4_1)
  goto lbl_77
  ::lbl_34::
  L1_1 = L0_1[5]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = L0_1[6]
    L1_1 = L1_1.matched
    if not L1_1 then
      L1_1 = L0_1[7]
      L1_1 = L1_1.matched
      if not L1_1 then
        L1_1 = L0_1[8]
        L1_1 = L1_1.matched
        if not L1_1 then
          goto lbl_56
        end
      end
    end
  end
  L1_1 = set_research_data
  L2_1 = "TamperingCMD"
  L3_1 = "DisableAntiVirus_DisableAntiSpyware"
  L4_1 = false
  L1_1(L2_1, L3_1, L4_1)
  goto lbl_77
  ::lbl_56::
  L1_1 = L0_1[9]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = L0_1[10]
    L1_1 = L1_1.matched
    if not L1_1 then
      L1_1 = L0_1[11]
      L1_1 = L1_1.matched
      if not L1_1 then
        L1_1 = L0_1[12]
        L1_1 = L1_1.matched
        if not L1_1 then
          goto lbl_77
        end
      end
    end
  end
  L1_1 = set_research_data
  L2_1 = "TamperingCMD"
  L3_1 = "ServiceStop"
  L4_1 = false
  L1_1(L2_1, L3_1, L4_1)
end
::lbl_77::
L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
L2_1 = false
L3_1 = pcall
L4_1 = MpCommon
L4_1 = L4_1.QuerySessionInformation
L5_1 = L1_1
L6_1 = MpCommon
L6_1 = L6_1.WTSIsRemoteSession
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L4_1
_ = L3_1
L3_1 = MpCommon
L3_1 = L3_1.NidSearch
L4_1 = mp
L4_1 = L4_1.NID_ENABLE_EXTENDED_BAFS
L5_1 = 3
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = set_research_data
  L4_1 = "Reason"
  L5_1 = "AggressivePeTrigger"
  L6_1 = false
  L3_1(L4_1, L5_1, L6_1)
else
  L3_1 = GetRollingQueueKeys
  L4_1 = "ThreatsOnMachine_Lua"
  L3_1 = L3_1(L4_1)
  if L3_1 ~= nil then
    L3_1 = GetRollingQueueKeys
    L4_1 = "ThreatsOnMachine_Lua"
    L3_1 = L3_1(L4_1)
    L4_1 = type
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 == "table" then
      L4_1 = next
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      if L4_1 ~= nil then
        L4_1 = set_research_data
        L5_1 = "Reason"
        L6_1 = "ExistingThreatsOnMachine"
        L7_1 = false
        L4_1(L5_1, L6_1, L7_1)
        L4_1 = set_research_data
        L5_1 = "ThreatsOnMachine"
        L6_1 = "["
        L7_1 = table
        L7_1 = L7_1.concat
        L8_1 = L3_1
        L9_1 = "|"
        L7_1 = L7_1(L8_1, L9_1)
        L8_1 = "]"
        L6_1 = L6_1 .. L7_1 .. L8_1
        L7_1 = false
        L4_1(L5_1, L6_1, L7_1)
      end
    end
  elseif L2_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.WTSUserName
    L4_1 = MpCommon
    L4_1 = L4_1.QueryPersistContextNoPath
    L5_1 = "MpNewRemoteUsers"
    L6_1 = L3_1
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = set_research_data
      L5_1 = "Reason"
      L6_1 = "NewRemoteUser"
      L7_1 = false
      L4_1(L5_1, L6_1, L7_1)
    end
  else
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.LOWFI
return L3_1
