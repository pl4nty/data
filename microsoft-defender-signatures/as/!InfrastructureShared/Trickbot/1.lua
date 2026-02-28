local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = {}
L1_1 = {}
L2_1 = "DisablePrivacyMode"
L1_1[1] = L2_1
L0_1["hklm\\software\\microsoft\\windows defender\\ux configuration"] = L1_1
L1_1 = {}
L2_1 = "DisableBlockAtFirstSeen"
L1_1[1] = L2_1
L0_1["hklm\\software\\microsoft\\windows defender\\spynet"] = L1_1
L1_1 = {}
L2_1 = "DisableBehaviorMonitoring"
L3_1 = "DisableIOAVProtection"
L4_1 = "DisableIntrusionPreventionSystem"
L5_1 = "DisableOnAccessProtection"
L6_1 = "DisableRealtimeMonitoring"
L7_1 = "DisableScanOnRealtimeEnable"
L8_1 = "DisableScriptScanning"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L0_1["hklm\\software\\microsoft\\windows defender\\real-time protection"] = L1_1
L1_1 = {}
L2_1 = "1"
L3_1 = "2"
L4_1 = "4"
L5_1 = "5"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L0_1["hklm\\software\\microsoft\\windows defender\\threats\\threatseveritydefaultaction"] = L1_1
L1_1 = {}
L2_1 = "DisableAntiSpyware"
L3_1 = "DisableAntiVirus"
L1_1[1] = L2_1
L1_1[2] = L3_1
L0_1["hklm\\software\\policies\\microsoft\\windows defender"] = L1_1
L1_1 = {}
L2_1 = "DisableBehaviorMonitoring"
L3_1 = "DisableIOAVProtection"
L4_1 = "DisableIntrusionPreventionSystem"
L5_1 = "DisableOnAccessProtection"
L6_1 = "DisableScanOnRealtimeEnable"
L7_1 = "DisableScriptScanning"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L0_1["hklm\\software\\policies\\microsoft\\windows defender\\real-time protection"] = L1_1
L1_1 = {}
L2_1 = "DisableBlockAtFirstSeen"
L1_1[1] = L2_1
L0_1["hklm\\software\\policies\\microsoft\\windows defender\\spynet"] = L1_1
L1_1 = {}
L2_1 = "1"
L3_1 = "2"
L4_1 = "4"
L5_1 = "5"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L0_1["hklm\\software\\policies\\microsoft\\windows defender\\threats\\threatseveritydefaultaction"] = L1_1
L1_1 = {}
L2_1 = "AllowBehaviorMonitoring"
L3_1 = "AllowIOAVProtection"
L4_1 = "AllowOnAccessProtection"
L5_1 = "AllowScriptScanning"
L6_1 = "DisableIntrusionPreventionSystem"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L0_1["hklm\\software\\policies\\microsoft\\windows defender\\policy manager"] = L1_1
L1_1 = {}
L2_1 = "1"
L3_1 = "2"
L4_1 = "4"
L5_1 = "5"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L0_1["hklm\\software\\policies\\microsoft\\windows defender\\policy manager\\threatseveritydefaultaction"] = L1_1
L1_1 = {}
L2_1 = {}
L3_1 = "DisableRealtimeMonitoring"
L2_1[1] = L3_1
L1_1["hklm\\software\\policies\\microsoft\\windows defender\\real-time protection"] = L2_1
L2_1 = {}
L3_1 = "AllowRealtimeMonitoring"
L2_1[1] = L3_1
L1_1["hklm\\software\\policies\\microsoft\\windows defender\\policy manager"] = L2_1
L2_1 = {}
L2_1.DisableRealtimeMonitoring = 0
L2_1.AllowRealtimeMonitoring = 1
L3_1 = Infrastructure_IsE5
L3_1 = L3_1()
L4_1 = Infrastructure_IsE3
L4_1 = L4_1()
L5_1 = pairs
L6_1 = L0_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = sysio
  L10_1 = L10_1.RegOpenKey
  L11_1 = L8_1
  L10_1 = L10_1(L11_1)
  if L10_1 then
    L11_1 = Infrastructure_DeleteRegistryEntriesOnValueMatch
    L12_1 = L10_1
    L13_1 = L9_1
    L11_1(L12_1, L13_1)
  end
end
L5_1 = pairs
L6_1 = L1_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = sysio
  L10_1 = L10_1.RegOpenKey
  L11_1 = L8_1
  L10_1 = L10_1(L11_1)
  if L10_1 then
    if L4_1 or L3_1 then
      L11_1 = pairs
      L12_1 = L9_1
      L11_1, L12_1, L13_1 = L11_1(L12_1)
      for L14_1, L15_1 in L11_1, L12_1, L13_1 do
        L16_1 = sysio
        L16_1 = L16_1.GetRegValueAsDword
        L17_1 = L10_1
        L18_1 = L15_1
        L16_1 = L16_1(L17_1, L18_1)
        L17_1 = L2_1[L15_1]
        if L16_1 and L17_1 and L16_1 ~= L17_1 then
          L18_1 = sysio
          L18_1 = L18_1.SetRegValueAsDword
          L19_1 = L10_1
          L20_1 = L15_1
          L21_1 = L17_1
          L18_1(L19_1, L20_1, L21_1)
        end
      end
    else
      L11_1 = Infrastructure_DeleteRegistryEntriesOnValueMatch
      L12_1 = L10_1
      L13_1 = L9_1
      L11_1(L12_1, L13_1)
    end
  end
end
