local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = isPublicIP
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nri
L1_1 = L1_1.AddTelemetry
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = nri
L4_1 = L4_1.Telemetry_HOSTNAME
L5_1 = nri
L5_1 = L5_1.Telemetry_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = nri
L4_1 = L4_1.Telemetry_QUERY
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1)
L1_1(L2_1, L3_1, L4_1, L5_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
