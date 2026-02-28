local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = tostring
L1_1 = headerpage
L0_1 = L0_1(L1_1)
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L0_1
L3_1 = L1_1
L2_1 = L2_1 .. L3_1
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1

function L3_1(A0_2)
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

L4_1 = L3_1
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L5_1 = table_dedup
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = {}
L5_1.SIG_CONTEXT = "AMSI"
L5_1.CONTENT_SOURCE = "LUAGENERIC_DEVIL_AMSI"
L5_1.PROCESS_CONTEXT = "wscript_or_cscript"
L5_1.FILELESS = "true"
L5_1.CMDLINE_URL = "true"
L6_1 = ipairs
L7_1 = L4_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L11_1 = string
  L11_1 = L11_1.match
  L12_1 = L10_1
  L13_1 = "^https?://"
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 then
    L11_1 = mp
    L11_1 = L11_1.CheckUrl
    L12_1 = L10_1
    L11_1, L12_1 = L11_1(L12_1)
    if L11_1 == 1 and L12_1 == 1 then
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
    L13_1 = SafeGetUrlReputation
    L14_1 = {}
    L15_1 = L10_1
    L14_1[1] = L15_1
    L15_1 = L5_1
    L16_1 = false
    L17_1 = 3000
    L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
    L14_1 = L13_1.urls
    L14_1 = L14_1[L10_1]
    if L14_1 then
      L14_1 = L13_1.urls
      L14_1 = L14_1[L10_1]
      L14_1 = L14_1.determination
      if L14_1 ~= 2 then
        L14_1 = L13_1.urls
        L14_1 = L14_1[L10_1]
        L14_1 = L14_1.determination
        if L14_1 ~= 3 then
          goto lbl_105
        end
      end
      L14_1 = L13_1.urls
      L14_1 = L14_1[L10_1]
      L14_1 = L14_1.confidence
      if 60 <= L14_1 then
        L14_1 = mp
        L14_1 = L14_1.INFECTED
        return L14_1
      end
    end
  end
  ::lbl_105::
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
