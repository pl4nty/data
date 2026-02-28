local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = {}
L1_1 = nri
L1_1 = L1_1.GetRawRequestBlob
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = ".exec"
L4_1 = "exploit"
L5_1 = "child_process"
L6_1 = "_chunks"
L7_1 = "spawn"
L8_1 = "eval"
L9_1 = "whomai"
L10_1 = "execsync"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = tohex
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L0_1.NRI_RequestBlob = L3_1
  L3_1 = nri
  L3_1 = L3_1.AddTelemetry
  L4_1 = mp
  L4_1 = L4_1.bitor
  L5_1 = mp
  L5_1 = L5_1.bitor
  L6_1 = nri
  L6_1 = L6_1.Telemetry_HOSTNAME
  L7_1 = nri
  L7_1 = L7_1.Telemetry_PATH
  L5_1 = L5_1(L6_1, L7_1)
  L6_1 = nri
  L6_1 = L6_1.Telemetry_QUERY
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = L0_1
  L3_1(L4_1, L5_1)
  L3_1 = reportHeaders
  L4_1 = {}
  L5_1 = "Host"
  L6_1 = "User-Agent"
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
