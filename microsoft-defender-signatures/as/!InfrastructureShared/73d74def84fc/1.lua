local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = false
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1.image_path
  L2_1 = L2_1(L3_1)
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "\\windows\\explorer.exe"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "\\powershell.exe"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      goto lbl_30
    end
  end
  L0_1 = true
end
::lbl_30::
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L4_1.SIG_CONTEXT = "CMD"
L4_1.CONTENT_SOURCE = "MSIEXEC_CMDLINE"
L4_1.PROCESS_CONTEXT = "msiexec.exe"
L4_1.FILELESS = "true"
L4_1.CMDLINE_URL = "true"
L5_1 = ExtractUrlGetReputation
L6_1 = L3_1
L7_1 = L4_1
L8_1 = true
L9_1 = 2
L10_1 = 60
L11_1 = false
L12_1 = 3000
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L5_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
