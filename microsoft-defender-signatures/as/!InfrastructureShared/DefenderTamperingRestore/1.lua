local L0_1, L1_1

function L0_1()
  local L0_2, L1_2
  L0_2 = Infrastructure_RemoveDefenderDAVASPolicyKey
  L0_2()
  L0_2 = Infrastructure_RemoveDefenderDAVASPrefKey
  L0_2()
end

Infrastructure_RestoreNonUxWDRootConfig = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = "hklm\\software\\microsoft\\windows defender\\real-time protection"
  L1_2 = "hklm\\software\\policies\\microsoft\\windows defender\\real-time protection"
  L2_2 = {}
  L3_2 = "DisableBehaviorMonitoring"
  L4_2 = "DisableIOAVProtection"
  L5_2 = "DisableOnAccessProtection"
  L6_2 = "DisableScanOnRealtimeEnable"
  L7_2 = "DisableScriptScanning"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L3_2 = Infrastructure_DelRegKeyValuesIfExist
  L4_2 = L0_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = Infrastructure_DelRegKeyValuesIfExist
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
end

Infrastructure_RestoreNonUxRealTimeProtections = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = "hklm\\software\\microsoft\\windows defender\\threats\\ThreatSeverityDefaultAction"
  L1_2 = "hklm\\software\\policies\\microsoft\\windows defender\\threats\\ThreatSeverityDefaultAction"
  L2_2 = "hklm\\software\\policies\\microsoft\\windows defender\\policy manager\\ThreatSeverityDefaultAction"
  L3_2 = {}
  L4_2 = "1"
  L5_2 = "2"
  L6_2 = "4"
  L7_2 = "5"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L4_2 = Infrastructure_DelRegKeyValuesIfExist
  L5_2 = L0_2
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
  L4_2 = Infrastructure_DelRegKeyValuesIfExist
  L5_2 = L1_2
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
  L4_2 = Infrastructure_DelRegKeyValuesIfExist
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
  L4_2 = "hklm\\software\\microsoft\\windows defender\\threats\\ThreatTypeDefaultAction"
  L5_2 = "hklm\\software\\policies\\microsoft\\windows defender\\threats\\ThreatTypeDefaultAction"
  L6_2 = {}
  L7_2 = "0"
  L8_2 = "1"
  L9_2 = "2"
  L10_2 = "3"
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L7_2 = Infrastructure_DelRegKeyValuesIfExist
  L8_2 = L4_2
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = Infrastructure_DelRegKeyValuesIfExist
  L8_2 = L5_2
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
end

Infrastructure_RestoreNonUxThreatActions = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = "hklm\\software\\microsoft\\windows defender\\spynet"
  L1_2 = "hklm\\software\\policies\\microsoft\\windows defender\\spynet"
  L2_2 = {}
  L3_2 = "DisableBlockAtFirstSeen"
  L2_2[1] = L3_2
  L3_2 = Infrastructure_DelRegKeyValuesIfExist
  L4_2 = L0_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = Infrastructure_DelRegKeyValuesIfExist
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
end

Infrastructure_RestoreNonUxSpynet = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = "hklm\\software\\policies\\microsoft\\windows defender\\policy manager"
  L1_2 = {}
  L2_2 = "AllowBehaviorMonitoring"
  L3_2 = "AllowIOAVProtection"
  L4_2 = "AllowOnAccessProtection"
  L5_2 = "AllowScriptScanning"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L2_2 = Infrastructure_DelRegKeyValuesIfExist
  L3_2 = L0_2
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
end

Infrastructure_RestoreNonUxPolicyManager = L0_1

function L0_1()
  local L0_2, L1_2
  L0_2 = Infrastructure_RestoreNonUxWDRootConfig
  L0_2()
  L0_2 = Infrastructure_RestoreNonUxRealTimeProtections
  L0_2()
  L0_2 = Infrastructure_RestoreNonUxThreatActions
  L0_2()
  L0_2 = Infrastructure_RestoreNonUxSpynet
  L0_2()
  L0_2 = Infrastructure_RestoreNonUxPolicyManager
  L0_2()
end

Infrastructure_RestoreNonUxControlledWDDefaults = L0_1
L0_1 = Infrastructure_RestoreNonUxControlledWDDefaults
L0_1()
