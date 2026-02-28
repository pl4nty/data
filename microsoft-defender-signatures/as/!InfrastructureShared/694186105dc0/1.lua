local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p1
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = ".installeranalytics.com"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = {}
    L1_1.SIG_CONTEXT = "BM"
    L1_1.CONTENT_SOURCE = "MSIEXEC_NRI"
    L1_1.PROCESS_CONTEXT = "msiexec.exe"
    L1_1.FILELESS = "false"
    L1_1.CMDLINE_URL = "false"
    L2_1 = ExtractUrlGetReputation
    L3_1 = L0_1
    L4_1 = L1_1
    L5_1 = true
    L6_1 = 2
    L7_1 = 60
    L8_1 = false
    L9_1 = 3000
    L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    if L2_1 then
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
      L5_1, L6_1, L7_1, L8_1, L9_1 = L5_1(L6_1, L7_1)
      L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
