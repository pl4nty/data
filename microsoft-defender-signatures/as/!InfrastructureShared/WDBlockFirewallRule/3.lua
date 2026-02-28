local L0_1, L1_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L0_2 = {}
  L0_2["mpcmdrun.exe"] = true
  L0_2["msascui.exe"] = true
  L0_2["configsecuritypolicy.exe"] = true
  L0_2["mpuxsrv.exe"] = true
  L0_2["msascuil.exe"] = true
  L0_2["msmpeng.exe"] = true
  L0_2["mssense.exe"] = true
  L0_2["sensecncproxy.exe"] = true
  L0_2["sensesampleuploader.exe"] = true
  L0_2["senseir.exe"] = true
  L0_2["nissrv.exe"] = true
  L0_2["mpdefendercoreservice.exe"] = true
  L0_2["sensendr.exe"] = true
  L0_2["sensetvm.exe"] = true
  L0_2["smartscreen.exe"] = true
  L1_2 = {}
  L1_2.sense = true
  L1_2.windefend = true
  L2_2 = "HKLM\\SYSTEM\\ControlSet001\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\FirewallRules"
  L3_2 = "HKLM\\SYSTEM\\ControlSet002\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\FirewallRules"
  L4_2 = {}
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L5_2 = pairs
  L6_2 = L4_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = sysio
    L10_2 = L10_2.RegOpenKey
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    if L10_2 then
      L11_2 = sysio
      L11_2 = L11_2.RegEnumValues
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      L12_2 = pairs
      L13_2 = L11_2
      L12_2, L13_2, L14_2 = L12_2(L13_2)
      for L15_2, L16_2 in L12_2, L13_2, L14_2 do
        if L16_2 then
          L17_2 = sysio
          L17_2 = L17_2.GetRegValueAsString
          L18_2 = L10_2
          L19_2 = L16_2
          L17_2 = L17_2(L18_2, L19_2)
          if L17_2 then
            L18_2 = string
            L18_2 = L18_2.lower
            L19_2 = L17_2
            L18_2 = L18_2(L19_2)
            L17_2 = L18_2
            L18_2 = string
            L18_2 = L18_2.find
            L19_2 = L17_2
            L20_2 = "action=block|active=true"
            L21_2 = 1
            L22_2 = true
            L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
            if L18_2 then
              L18_2 = string
              L18_2 = L18_2.match
              L19_2 = L17_2
              L20_2 = "|app=.*\\([^\\]+%.exe)"
              L18_2 = L18_2(L19_2, L20_2)
              if L18_2 then
                L19_2 = L0_2[L18_2]
                if L19_2 then
                  L19_2 = MpDetection
                  L19_2 = L19_2.ReportResource
                  L20_2 = "regkeyvalue"
                  L21_2 = L9_2
                  L22_2 = "\\\\"
                  L23_2 = L16_2
                  L21_2 = L21_2 .. L22_2 .. L23_2
                  L22_2 = 2591
                  L23_2 = false
                  L19_2(L20_2, L21_2, L22_2, L23_2)
                end
              else
                L19_2 = string
                L19_2 = L19_2.match
                L20_2 = L17_2
                L21_2 = "|svc=([^|]+)"
                L19_2 = L19_2(L20_2, L21_2)
                L18_2 = L19_2
                if L18_2 then
                  L19_2 = L1_2[L18_2]
                  if L19_2 then
                    L19_2 = MpDetection
                    L19_2 = L19_2.ReportResource
                    L20_2 = "regkeyvalue"
                    L21_2 = L9_2
                    L22_2 = "\\\\"
                    L23_2 = L16_2
                    L21_2 = L21_2 .. L22_2 .. L23_2
                    L22_2 = 2591
                    L23_2 = false
                    L19_2(L20_2, L21_2, L22_2, L23_2)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

Infrastructure_ScanWDFirewallBlockRules = L0_1
