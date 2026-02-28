local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
L1_1 = nri
L1_1 = L1_1.GetRawRequestBlob
L1_1 = L1_1()
if not L1_1 then
  L2_1 = nri
  L2_1 = L2_1.GetRawResponseBlob
  L2_1 = L2_1()
  L1_1 = L2_1
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = tohex
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L0_1.NRI_ResponseBlob = L2_1
L2_1 = nri
L2_1 = L2_1.AddTelemetry
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = nri
L5_1 = L5_1.Telemetry_HOSTNAME
L6_1 = nri
L6_1 = L6_1.Telemetry_PATH
L4_1 = L4_1(L5_1, L6_1)
L5_1 = nri
L5_1 = L5_1.Telemetry_QUERY
L3_1 = L3_1(L4_1, L5_1)
L4_1 = L0_1
L2_1(L3_1, L4_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
