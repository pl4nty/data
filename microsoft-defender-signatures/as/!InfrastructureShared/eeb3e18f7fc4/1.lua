local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = GetRollingQueueCount
L1_1 = "HumYam-Successful-Logon-Ip-Counter"
L0_1 = L0_1(L1_1)
if 1000 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = parseLogonEvent
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L0_1 = L0_1(L1_1)
L1_1 = getIpAddressClass
L2_1 = L0_1.Ip
L1_1 = L1_1(L2_1)
if L1_1 == 2 or L1_1 == 8 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = AppendToRollingQueue
L3_1 = "HumYam-Successful-Logon-Ip-Counter"
L4_1 = L0_1.Ip
L5_1 = 0
L6_1 = 604800
L7_1 = 1000
L8_1 = 1
L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
