local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.OriginalFilename
  L1_1 = L1_1(L2_1)
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1.InternalName
  L2_1 = L2_1(L3_1)
  if L1_1 ~= nil and L1_1 ~= "" then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "MpInternal_researchdata=OFN="
    L5_1 = L1_1
    L4_1 = L4_1 .. L5_1
    L3_1(L4_1)
    L3_1 = MpCommon
    L3_1 = L3_1.StringRegExpSearch
    L4_1 = "(procexp|handle|tcpview|winobj|logonsessions|tcpvcon)"
    L5_1 = L1_1
    L3_1, L4_1 = L3_1(L4_1, L5_1)
    if L3_1 == true then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
  elseif L2_1 ~= nil and L2_1 ~= "" then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "MpInternal_researchdata=InternalName="
    L5_1 = L2_1
    L4_1 = L4_1 .. L5_1
    L3_1(L4_1)
    L3_1 = MpCommon
    L3_1 = L3_1.StringRegExpSearch
    L4_1 = "(procexp|handle|tcpview|winobj|logonsessions|tcpvcon)"
    L5_1 = L2_1
    L3_1, L4_1 = L3_1(L4_1, L5_1)
    if L3_1 == true then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
  end
end
L1_1 = ""
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "HSTR:ProcessHacker"
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = "ProcessHacker"
else
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "HSTR:ProcessExplorer"
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L1_1 = "ProcessExplorer"
  end
end

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = 1
  L1_2 = pehdr
  L1_2 = L1_2.NumberOfSections
  L2_2 = 1
  for L3_2 = L0_2, L1_2, L2_2 do
    L4_2 = tostring
    L5_2 = pesecs
    L5_2 = L5_2[L3_2]
    L5_2 = L5_2.Name
    L4_2 = L4_2(L5_2)
    if L4_2 == ".rsrc" then
      L4_2 = pesecs
      L4_2 = L4_2[L3_2]
      L4_2 = L4_2.PointerToRawData
      L5_2 = pesecs
      L5_2 = L5_2[L3_2]
      L5_2 = L5_2.VirtualAddress
      return L4_2, L5_2
    end
  end
end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = mp
  L1_2 = L1_2.readfile
  L2_2 = A0_2
  L3_2 = 20
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = mp
  L2_2 = L2_2.readu_u16
  L3_2 = L1_2
  L4_2 = 15
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = A0_2 + 16
  L4_2 = L2_2
  L5_2 = L3_2
  return L4_2, L5_2
end

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = mp
  L1_2 = L1_2.readfile
  L2_2 = A0_2
  L3_2 = 8
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = mp
  L2_2 = L2_2.readu_u32
  L3_2 = L1_2
  L4_2 = 1
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = mp
  L3_2 = L3_2.readu_u32
  L4_2 = L1_2
  L5_2 = 5
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = mp
  L4_2 = L4_2.bitand
  L5_2 = L2_2
  L6_2 = 2147483647
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = mp
  L5_2 = L5_2.bitand
  L6_2 = L2_2
  L7_2 = 4294901760
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = mp
  L6_2 = L6_2.bitand
  L7_2 = L2_2
  L8_2 = 65535
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = mp
  L7_2 = L7_2.shr32
  L8_2 = mp
  L8_2 = L8_2.bitand
  L9_2 = L3_2
  L10_2 = 2147483648
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = 31
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = mp
  L8_2 = L8_2.bitand
  L9_2 = L3_2
  L10_2 = 2147483647
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = L2_2
  L10_2 = L3_2
  L11_2 = L4_2
  L12_2 = L5_2
  L13_2 = L6_2
  L14_2 = L7_2
  L15_2 = L8_2
  return L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
end

function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = mp
  L1_2 = L1_2.readfile
  L2_2 = A0_2
  L3_2 = 20
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = mp
  L2_2 = L2_2.readu_u32
  L3_2 = L1_2
  L4_2 = 1
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = mp
  L3_2 = L3_2.readu_u32
  L4_2 = L1_2
  L5_2 = 5
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = mp
  L4_2 = L4_2.readu_u32
  L5_2 = L1_2
  L6_2 = 9
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = mp
  L5_2 = L5_2.readu_u32
  L6_2 = L1_2
  L7_2 = 13
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L2_2
  L7_2 = L3_2
  L8_2 = L4_2
  L9_2 = L5_2
  return L6_2, L7_2, L8_2, L9_2
end

L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = false
L6_1(L7_1)
L6_1 = L2_1
L6_1, L7_1 = L6_1()
L8_1 = L3_1
L9_1 = L6_1
L8_1, L9_1 = L8_1(L9_1)
L10_1 = 0
L11_1 = L8_1
L12_1 = 1
for L13_1 = L10_1, L11_1, L12_1 do
  L14_1 = L13_1 * 8
  L14_1 = L9_1 + L14_1
  L15_1 = L4_1
  L16_1 = L14_1
  L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L15_1(L16_1)
  L22_1 = L6_1 + L21_1
  L23_1 = L3_1
  L24_1 = L22_1
  L23_1, L24_1 = L23_1(L24_1)
  L25_1 = 0
  L26_1 = L23_1
  L27_1 = 1
  for L28_1 = L25_1, L26_1, L27_1 do
    L29_1 = L28_1 * 8
    L29_1 = L24_1 + L29_1
    L30_1 = L4_1
    L31_1 = L29_1
    L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1 = L30_1(L31_1)
    L37_1 = L6_1 + L36_1
    L38_1 = L3_1
    L39_1 = L37_1
    L38_1, L39_1 = L38_1(L39_1)
    L40_1 = 0
    L41_1 = L38_1
    L42_1 = 1
    for L43_1 = L40_1, L41_1, L42_1 do
      L44_1 = L43_1 * 8
      L44_1 = L39_1 + L44_1
      L45_1 = L4_1
      L46_1 = L44_1
      L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1 = L45_1(L46_1)
      L52_1 = L6_1 + L51_1
      L53_1 = L5_1
      L54_1 = L52_1
      L53_1, L54_1 = L53_1(L54_1)
      if L7_1 < L53_1 then
        L55_1 = L53_1 - L7_1
        L55_1 = L55_1 + L6_1
        L56_1 = mp
        L56_1 = L56_1.readfile
        L57_1 = L55_1
        L58_1 = 2
        L56_1 = L56_1(L57_1, L58_1)
        if L56_1 == "MZ" then
          L57_1 = mp
          L57_1 = L57_1.set_mpattribute
          L58_1 = "MpInternal_researchdata=Driver="
          L59_1 = L1_1
          L58_1 = L58_1 .. L59_1
          L57_1(L58_1)
          L57_1 = mp
          L57_1 = L57_1.INFECTED
          return L57_1
        end
      end
    end
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
