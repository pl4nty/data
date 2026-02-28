local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = sysio
L0_1 = L0_1.RegOpenKey
L1_1 = "HKLM\\SYSTEM\\CurrentControlSet\\services\\Tcpip\\Parameters"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = sysio
  L1_1 = L1_1.GetRegValueAsString
  L2_1 = L0_1
  L3_1 = "DhcpNameServer"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "82.163.143."
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = Infrastructure_ClearALLDNS
      L2_1()
      L2_1 = Remediation
      L2_1 = L2_1.SetRebootRequired
      L2_1()
    end
  end
end
