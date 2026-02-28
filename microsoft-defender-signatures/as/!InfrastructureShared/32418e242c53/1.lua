local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p1
  end
end
if L0_1 ~= nil then
  L1_1 = {}
  L2_1 = "getParameter"
  L3_1 = "cmd="
  L4_1 = "InputStream"
  L5_1 = "webapps//ROOT//"
  L6_1 = "class"
  L7_1 = "suffix"
  L8_1 = "tomcatwar"
  L9_1 = "whoami"
  L10_1 = "pwd"
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L1_1[3] = L4_1
  L1_1[4] = L5_1
  L1_1[5] = L6_1
  L1_1[6] = L7_1
  L1_1[7] = L8_1
  L1_1[8] = L9_1
  L1_1[9] = L10_1
  L2_1 = contains
  L3_1 = L0_1
  L4_1 = L1_1
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = nri
  L2_1 = L2_1.GetRawRequestBlob
  L2_1 = L2_1()
  if L2_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.len
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 < 4096 then
      L3_1 = {}
      L4_1 = tohex
      L5_1 = L2_1
      L4_1 = L4_1(L5_1)
      L3_1.NRI_ResponseBlob = L4_1
      L4_1 = nri
      L4_1 = L4_1.AddTelemetry
      L5_1 = mp
      L5_1 = L5_1.bitor
      L6_1 = mp
      L6_1 = L6_1.bitor
      L7_1 = nri
      L7_1 = L7_1.Telemetry_HOSTNAME
      L8_1 = nri
      L8_1 = L8_1.Telemetry_PATH
      L6_1 = L6_1(L7_1, L8_1)
      L7_1 = nri
      L7_1 = L7_1.Telemetry_QUERY
      L5_1 = L5_1(L6_1, L7_1)
      L6_1 = L3_1
      L4_1(L5_1, L6_1)
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
