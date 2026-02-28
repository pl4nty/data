local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L2_1 = L0_1.ppid
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = IsPidExcluded
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L1_1
  L3_1 = L1_1.match
  L5_1 = "([^\\]+)$"
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = {}
  L4_1["ng bailey image collector.exe"] = true
  L4_1["log-agent.exe"] = true
  L4_1["ossec-agent.exe"] = true
  L4_1["epclient.exe"] = true
  L4_1["addmremquery_x86_64_v2.exe"] = true
  L5_1 = L4_1[L3_1]
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.GetProcessCommandLine
  L6_1 = L0_1.ppid
  L5_1 = L5_1(L6_1)
  if L5_1 ~= nil then
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    L5_1 = L6_1
    L7_1 = L5_1
    L6_1 = L5_1.find
    L8_1 = "alwaysonvpn"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L7_1 = L5_1
    L6_1 = L5_1.find
    L8_1 = "epws\\client\\"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
  end
  L6_1 = GetDetectionThresholdMetReason
  L7_1 = L2_1
  L6_1, L7_1 = L6_1(L7_1)
  if L6_1 then
    L8_1 = mp
    L8_1 = L8_1.bitxor
    L9_1 = L7_1
    L10_1 = 32
    L8_1 = L8_1(L9_1, L10_1)
    if L8_1 ~= 0 then
      L8_1 = mp
      L8_1 = L8_1.LOWFI
      return L8_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
