local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = string
L0_1 = L0_1.find
L1_1 = Remediation
L1_1 = L1_1.Threat
L1_1 = L1_1.Name
L2_1 = "^Trojan:Win64/Posilod%.E"
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == nil then
  return
end
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Name
L1_1 = {}
L1_1["Trojan:Win64/Posilod.EB"] = true
L1_1["Trojan:Win64/Posilod.EC"] = true
L1_1["Trojan:Win64/Posilod.ED"] = true
L1_1["Trojan:Win64/Posilod.EF"] = true
L1_1["Trojan:Win64/Posilod.EG"] = true
L2_1 = L1_1[L0_1]
if L2_1 == nil then
  return
end
L2_1 = pairs
L3_1 = Remediation
L3_1 = L3_1.Threat
L3_1 = L3_1.Resources
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.Schema
  if L7_1 == "file" then
    L7_1 = crypto
    L7_1 = L7_1.bitand
    L8_1 = L6_1.Type
    L9_1 = MpCommon
    L9_1 = L9_1.MPRESOURCE_TYPE_CONCRETE
    L7_1 = L7_1(L8_1, L9_1)
    L8_1 = MpCommon
    L8_1 = L8_1.MPRESOURCE_TYPE_CONCRETE
    if L7_1 == L8_1 then
      L7_1 = L6_1.Path
      if L7_1 ~= nil then
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = string
        L9_1 = L9_1.lower
        L10_1 = L7_1
        L9_1 = L9_1(L10_1)
        L10_1 = "onedrive"
        L11_1 = 1
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if L8_1 ~= nil then
          L8_1 = Infrastructure_SplitThreatPath
          L9_1 = L7_1
          L8_1, L9_1, L10_1 = L8_1(L9_1)
          if L10_1 == "filesyncclient.dll" then
            L12_1 = L8_1
            L11_1 = L8_1.match
            L13_1 = "(.*\\)[^\\]+\\$"
            L11_1 = L11_1(L12_1, L13_1)
            L12_1 = L11_1
            L13_1 = "OneDrive.exe"
            L12_1 = L12_1 .. L13_1
            L13_1 = sysio
            L13_1 = L13_1.IsFileExists
            L14_1 = L12_1
            L13_1 = L13_1(L14_1)
            if L13_1 then
              L13_1 = sysio
              L13_1 = L13_1.GetProcessFromFileName
              L14_1 = L12_1
              L13_1 = L13_1(L14_1)
              L14_1 = pairs
              L15_1 = L13_1
              L14_1, L15_1, L16_1 = L14_1(L15_1)
              for L17_1, L18_1 in L14_1, L15_1, L16_1 do
                L19_1 = string
                L19_1 = L19_1.format
                L20_1 = "pid:%d,ProcessStart:%u"
                L21_1 = L18_1.pid
                L22_1 = L18_1.starttime
                L19_1 = L19_1(L20_1, L21_1, L22_1)
                L20_1 = sysio
                L20_1 = L20_1.TerminateProcess
                L21_1 = L19_1
                L20_1(L21_1)
              end
            end
          end
        end
      end
    end
  end
end
