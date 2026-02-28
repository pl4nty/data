local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L0_1 == "explorer.exe" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESS_PPID
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "^pid:(%w+),ProcessStart:(%w+)$"
  L2_1, L3_1 = L2_1(L3_1, L4_1)
  L4_1 = tonumber
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L5_1 = tonumber
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  L6_1 = mp
  L6_1 = L6_1.bsplit
  L7_1 = L5_1
  L8_1 = 32
  L6_1, L7_1 = L6_1(L7_1, L8_1)
  L8_1 = string
  L8_1 = L8_1.format
  L9_1 = "ppids:{{%d,%d,%d}}\000"
  L10_1 = L4_1
  L11_1 = L6_1
  L12_1 = L7_1
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  L9_1 = mp
  L9_1 = L9_1.TriggerScanResource
  L10_1 = "ems"
  L11_1 = L8_1
  L12_1 = mp
  L12_1 = L12_1.SCANSOURCE_RTSIG
  L13_1 = 3000
  L9_1(L10_1, L11_1, L12_1, L13_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
