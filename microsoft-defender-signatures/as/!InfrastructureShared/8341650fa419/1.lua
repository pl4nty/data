local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = {}
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nri
L2_1 = L2_1.GetRawRequestBlob
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "deserialization"
L5_1 = "system.runtime.serialization"
L6_1 = "invalid viewstate"
L7_1 = "base64"
L8_1 = "payload"
L9_1 = "javaScriptserializer"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L4_1 = contains
L5_1 = L2_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = nri
  L4_1 = L4_1.GetURI
  L4_1 = L4_1()
  if L4_1 then
    L1_1.uri = L4_1
  end
  L1_1.dest_address = L0_1
  L5_1 = tohex
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L1_1.NRI_RBlob = L5_1
  L5_1 = nri
  L5_1 = L5_1.AddTelemetry
  L6_1 = mp
  L6_1 = L6_1.bitor
  L7_1 = mp
  L7_1 = L7_1.bitor
  L8_1 = nri
  L8_1 = L8_1.Telemetry_HOSTNAME
  L9_1 = nri
  L9_1 = L9_1.Telemetry_PATH
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = nri
  L8_1 = L8_1.Telemetry_QUERY
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = L1_1
  L5_1(L6_1, L7_1)
  L5_1 = reportHeaders
  L6_1 = {}
  L7_1 = "Host"
  L8_1 = "User-Agent"
  L6_1[1] = L7_1
  L6_1[2] = L8_1
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
