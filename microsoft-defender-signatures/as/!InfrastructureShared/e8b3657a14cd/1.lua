local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = " /i "
L5_1 = " /q "
L6_1 = " -i "
L7_1 = " -q "
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "%'?\"?https?%://(%d+%.%d+%.%d+%.%d+)"
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = isPublicIP
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "(https?%://%d+%.%d+%.%d+%.%d+.*%.msi)"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
if not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = {}
L7_1.SIG_CONTEXT = "MSIExec_IPCheck"
L7_1.CONTENT_SOURCE = "BM"
L7_1.PROCESS_CONTEXT = "MSIEXEC.EXE"
L7_1.FILELESS = "true"
L7_1.CMDLINE_URL = "true"
L7_1.TAG = "INTERFLOW"
L8_1 = SafeGetUrlReputation
L9_1 = {}
L10_1 = L6_1
L9_1[1] = L10_1
L10_1 = L7_1
L11_1 = false
L12_1 = 2000
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
L9_1 = L8_1.urls
L9_1 = L9_1[L6_1]
if L9_1 then
  L9_1 = L8_1.urls
  L9_1 = L9_1[L6_1]
  L9_1 = L9_1.determination
  if L9_1 == 2 then
    L9_1 = L8_1.urls
    L9_1 = L9_1[L6_1]
    L9_1 = L9_1.confidence
    if 60 <= L9_1 then
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
