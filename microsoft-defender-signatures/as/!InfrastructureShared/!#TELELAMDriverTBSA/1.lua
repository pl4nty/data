local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1, L63_1, L64_1, L65_1, L66_1, L67_1, L68_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = peattributes
L1_1 = L1_1.no_security
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end

function L1_1()
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

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
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
  L3_2 = mp
  L3_2 = L3_2.readu_u16
  L4_2 = L1_2
  L5_2 = 13
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = A0_2 + 16
  L5_2 = L2_2
  L6_2 = L3_2
  L7_2 = L4_2
  return L5_2, L6_2, L7_2
end

function L3_1(A0_2)
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

function L4_1(A0_2)
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

L5_1 = {}
L5_1.E17764C39F2AFD7114F8528D2F9783D9A591F6679715EECE730A262CF5CFD3B3 = "62009aaabdae749fd47d19150958329bf6ff4b34"
L5_1["84D8717A416C8C9E214C6E0DBD091860D8133F413BCFF35673998F27BBA084CA"] = "b9eaa034c821c159b05d3521bcf7feb796ebd6ff"
L5_1.A08E79C386083D875014C409C13D144E0A24386132980DF11FF59737C8489EB1 = "007790f6561dad89b0bcd85585762495e358f8a5"
L5_1["4843A82ED3B1F2BFBEE9671960E1940C942F688D"] = "495847a93187cfb8c71f840cb7b41497ad95c64f"
L5_1["47F4B9898631773231B32844EC0D49990AC4EB1E"] = "409AA4A74A0CDA7C0FEE6BD0BB8823D16B5F1875"
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = false
L6_1(L7_1)
L6_1 = L1_1
L6_1, L7_1 = L6_1()
L8_1 = L2_1
L9_1 = L6_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
if L9_1 == 0 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = 0
L12_1 = L9_1
L13_1 = 1
for L14_1 = L11_1, L12_1, L13_1 do
  L15_1 = L14_1 * 8
  L15_1 = L10_1 + L15_1
  L16_1 = L3_1
  L17_1 = L15_1
  L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L16_1(L17_1)
  L23_1 = mp
  L23_1 = L23_1.readfile
  L24_1 = L6_1 + L18_1
  L25_1 = 40
  L23_1 = L23_1(L24_1, L25_1)
  L24_1 = string
  L24_1 = L24_1.gsub
  L25_1 = L23_1
  L26_1 = "%z"
  L27_1 = ""
  L24_1 = L24_1(L25_1, L26_1, L27_1)
  L23_1 = L24_1
  L24_1 = string
  L24_1 = L24_1.find
  L25_1 = L23_1
  L26_1 = "MSELAMCERTINFOID"
  L27_1 = 1
  L28_1 = true
  L24_1 = L24_1(L25_1, L26_1, L27_1, L28_1)
  if L24_1 then
    L24_1 = mp
    L24_1 = L24_1.set_mpattribute
    L25_1 = "Lua:ELAMDriver"
    L24_1(L25_1)
    L24_1 = L6_1 + L22_1
    L25_1 = L2_1
    L26_1 = L24_1
    L25_1, L26_1, L27_1 = L25_1(L26_1)
    if L26_1 == 0 then
      L28_1 = mp
      L28_1 = L28_1.CLEAN
      return L28_1
    end
    L28_1 = 0
    L29_1 = L26_1
    L30_1 = 1
    for L31_1 = L28_1, L29_1, L30_1 do
      L32_1 = L31_1 * 8
      L32_1 = L27_1 + L32_1
      L33_1 = L3_1
      L34_1 = L32_1
      L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1 = L33_1(L34_1)
      L40_1 = mp
      L40_1 = L40_1.readfile
      L41_1 = L6_1 + L35_1
      L42_1 = 70
      L40_1 = L40_1(L41_1, L42_1)
      L41_1 = string
      L41_1 = L41_1.gsub
      L42_1 = L40_1
      L43_1 = "%z"
      L44_1 = ""
      L41_1 = L41_1(L42_1, L43_1, L44_1)
      L40_1 = L41_1
      L41_1 = string
      L41_1 = L41_1.find
      L42_1 = L40_1
      L43_1 = "MICROSOFTELAMCERTIFICATEINFO"
      L44_1 = 1
      L45_1 = true
      L41_1 = L41_1(L42_1, L43_1, L44_1, L45_1)
      if L41_1 then
        L41_1 = L6_1 + L39_1
        L42_1 = L2_1
        L43_1 = L41_1
        L42_1, L43_1, L44_1 = L42_1(L43_1)
        L45_1 = 0
        L46_1 = L42_1
        L47_1 = 1
        for L48_1 = L45_1, L46_1, L47_1 do
          L49_1 = L48_1 * 8
          L49_1 = L44_1 + L49_1
          L50_1 = L3_1
          L51_1 = L49_1
          L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1 = L50_1(L51_1)
          L57_1 = L6_1 + L56_1
          L58_1 = L4_1
          L59_1 = L57_1
          L58_1, L59_1 = L58_1(L59_1)
          if L59_1 <= 4000 and L7_1 < L58_1 then
            L60_1 = L58_1 - L7_1
            L60_1 = L60_1 + L6_1
            L61_1 = mp
            L61_1 = L61_1.readfile
            L62_1 = L60_1
            L63_1 = L59_1
            L61_1 = L61_1(L62_1, L63_1)
            L62_1 = string
            L62_1 = L62_1.gsub
            L63_1 = L61_1
            L64_1 = "%z"
            L65_1 = ""
            L62_1 = L62_1(L63_1, L64_1, L65_1)
            L61_1 = L62_1
            L62_1 = pairs
            L63_1 = L5_1
            L62_1, L63_1, L64_1 = L62_1(L63_1)
            for L65_1 in L62_1, L63_1, L64_1 do
              L67_1 = L61_1
              L66_1 = L61_1.match
              L68_1 = L65_1
              L66_1 = L66_1(L67_1, L68_1)
              if L66_1 ~= nil then
                L66_1 = mp
                L66_1 = L66_1.set_mpattribute
                L67_1 = "MpInternal_researchdata=TBSHash="
                L68_1 = L65_1
                L67_1 = L67_1 .. L68_1
                L66_1(L67_1)
                L66_1 = mp
                L66_1 = L66_1.INFECTED
                return L66_1
              end
            end
          end
        end
      end
    end
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
