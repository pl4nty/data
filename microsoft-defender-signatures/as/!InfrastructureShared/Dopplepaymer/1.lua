local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = false
L1_1 = sysio
L1_1 = L1_1.RegOpenKey
L2_1 = "HKLM\\SYSTEM"
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = sysio
  L2_1 = L2_1.RegEnumKeys
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L3_1 = pairs
    L4_1 = L2_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = string
      L8_1 = L8_1.match
      L9_1 = L7_1
      L10_1 = "ControlSet%d%d%d"
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 then
        L8_1 = Infrastructure_RepairServiceAtPath
        L9_1 = "VSS"
        L10_1 = L7_1
        L8_1 = L8_1(L9_1, L10_1)
        L0_1 = L8_1 or L0_1
        if not L8_1 then
        end
        L8_1 = Infrastructure_RepairServiceAtPath
        L9_1 = "WinDefend"
        L10_1 = L7_1
        L8_1 = L8_1(L9_1, L10_1)
        L0_1 = L8_1 or L0_1
        if not L8_1 then
        end
        L8_1 = Infrastructure_RepairServiceAtPath
        L9_1 = "MsMpSvc"
        L10_1 = L7_1
        L8_1 = L8_1(L9_1, L10_1)
        L0_1 = L8_1 or L0_1
        if not L8_1 then
        end
        L8_1 = Infrastructure_RepairServiceAtPath
        L9_1 = "eventlog"
        L10_1 = L7_1
        L8_1 = L8_1(L9_1, L10_1)
        L0_1 = L8_1 or L0_1
        if not L8_1 then
        end
        L8_1 = Infrastructure_RepairServiceAtPath
        L9_1 = "WdNisSvc"
        L10_1 = L7_1
        L8_1 = L8_1(L9_1, L10_1)
        L0_1 = L8_1 or L0_1
        if not L8_1 then
        end
      end
    end
  end
end
if L0_1 then
  L2_1 = Remediation
  L2_1 = L2_1.SetRebootRequired
  L2_1()
end
