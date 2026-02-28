local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L2_2 = string
  L2_2 = L2_2.gmatch
  L3_2 = A0_2
  L4_2 = "http[s]?://[^\"%s]+"
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  for L5_2 in L2_2, L3_2, L4_2 do
    L6_2 = table
    L6_2 = L6_2.insert
    L7_2 = L1_2
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  end
  return L1_2
end

L3_1 = L2_1
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L4_1 = {}
L4_1.SIG_CONTEXT = "CMD"
L4_1.CONTENT_SOURCE = "MSHTA_SCHTASK"
L4_1.PROCESS_CONTEXT = "schtasks.exe"
L4_1.FILELESS = "true"
L4_1.CMDLINE_URL = "true"
L4_1.TAG = "INTERFLOW"
L5_1 = ipairs
L6_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = string
  L10_1 = L10_1.match
  L11_1 = L9_1
  L12_1 = "^https?://"
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 then
    L10_1 = SafeGetUrlReputation
    L11_1 = {}
    L12_1 = L9_1
    L11_1[1] = L12_1
    L12_1 = L4_1
    L13_1 = false
    L14_1 = 3000
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    L11_1 = L10_1.urls
    L11_1 = L11_1[L9_1]
    if L11_1 then
      L11_1 = L10_1.urls
      L11_1 = L11_1[L9_1]
      L11_1 = L11_1.determination
      if L11_1 == 2 then
        L11_1 = L10_1.urls
        L11_1 = L11_1[L9_1]
        L11_1 = L11_1.confidence
        if 60 <= L11_1 then
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
