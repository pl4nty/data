local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end

function L1_1(A0_2)
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

if L0_1 ~= nil then
  L2_1 = L1_1
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  L3_1 = {}
  L3_1.SIG_CONTEXT = "BM"
  L3_1.CONTENT_SOURCE = "ITW_PS_SCHTASK"
  L3_1.PROCESS_CONTEXT = "powershell.exe"
  L3_1.FILELESS = "true"
  L3_1.CMDLINE_URL = "true"
  L4_1 = ipairs
  L5_1 = L2_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = string
    L9_1 = L9_1.match
    L10_1 = L8_1
    L11_1 = "^https?://"
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.CheckUrl
      L10_1 = L8_1
      L9_1, L10_1 = L9_1(L10_1)
      if L9_1 == 1 and L10_1 == 1 then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L11_1 = SafeGetUrlReputation
      L12_1 = {}
      L13_1 = L8_1
      L12_1[1] = L13_1
      L13_1 = L3_1
      L14_1 = false
      L15_1 = 3000
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      L12_1 = L11_1.urls
      L12_1 = L12_1[L8_1]
      if L12_1 then
        L12_1 = L11_1.urls
        L12_1 = L12_1[L8_1]
        L12_1 = L12_1.determination
        if L12_1 == 2 then
          L12_1 = L11_1.urls
          L12_1 = L12_1[L8_1]
          L12_1 = L12_1.confidence
          if 60 <= L12_1 then
            L12_1 = mp
            L12_1 = L12_1.INFECTED
            return L12_1
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
