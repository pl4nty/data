local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1

function L0_1()
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

function L1_1(A0_2)
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

function L2_1(A0_2)
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

function L3_1(A0_2)
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

L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = L0_1
L4_1, L5_1 = L4_1()
L6_1 = L1_1
L7_1 = L4_1
L6_1, L7_1 = L6_1(L7_1)
L8_1 = 0
L9_1 = L6_1
L10_1 = 1
for L11_1 = L8_1, L9_1, L10_1 do
  L12_1 = L11_1 * 8
  L12_1 = L7_1 + L12_1
  L13_1 = L2_1
  L14_1 = L12_1
  L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L13_1(L14_1)
  if L17_1 == 23 then
    L20_1 = L4_1 + L19_1
    L21_1 = L1_1
    L22_1 = L20_1
    L21_1, L22_1 = L21_1(L22_1)
    L23_1 = 0
    L24_1 = L21_1
    L25_1 = 1
    for L26_1 = L23_1, L24_1, L25_1 do
      L27_1 = L26_1 * 8
      L27_1 = L22_1 + L27_1
      L28_1 = L2_1
      L29_1 = L27_1
      L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1 = L28_1(L29_1)
      L35_1 = L4_1 + L34_1
      L36_1 = L1_1
      L37_1 = L35_1
      L36_1, L37_1 = L36_1(L37_1)
      L38_1 = 0
      L39_1 = L36_1
      L40_1 = 1
      for L41_1 = L38_1, L39_1, L40_1 do
        L42_1 = L41_1 * 8
        L42_1 = L37_1 + L42_1
        L43_1 = L2_1
        L44_1 = L42_1
        L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1 = L43_1(L44_1)
        L50_1 = L4_1 + L49_1
        L51_1 = L3_1
        L52_1 = L50_1
        L51_1, L52_1 = L51_1(L52_1)
        if L52_1 <= 20000 and L5_1 < L51_1 then
          L53_1 = L51_1 - L5_1
          L53_1 = L53_1 + L4_1
          L54_1 = mp
          L54_1 = L54_1.readfile
          L55_1 = L53_1
          L56_1 = L52_1
          L54_1 = L54_1(L55_1, L56_1)
          L55_1 = mp
          L55_1 = L55_1.readu_u32
          L56_1 = L54_1
          L57_1 = 1
          L55_1 = L55_1(L56_1, L57_1)
          if L55_1 == 4290969856 then
            L55_1 = mp
            L55_1 = L55_1.set_mpattribute
            L56_1 = "//Lua:HTA2EXE_EmbeddedHTA"
            L55_1(L56_1)
            L55_1 = string
            L55_1 = L55_1.gsub
            L56_1 = L54_1
            L57_1 = "(..)"
            
            function L58_1(A0_2)
              local L1_2, L2_2, L3_2, L4_2
              L1_2 = string
              L1_2 = L1_2.char
              L2_2 = mp
              L2_2 = L2_2.bitxor
              L3_2 = string
              L3_2 = L3_2.byte
              L4_2 = A0_2
              L3_2 = L3_2(L4_2)
              L4_2 = 255
              L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
              return L1_2(L2_2, L3_2, L4_2)
            end
            
            L55_1 = L55_1(L56_1, L57_1, L58_1)
            L56_1 = mp
            L56_1 = L56_1.vfo_add_buffer
            L57_1 = L55_1
            L58_1 = "EmbeddedHTA"
            L59_1 = mp
            L59_1 = L59_1.ADD_VFO_TAKE_ACTION_ON_DAD
            L56_1(L57_1, L58_1, L59_1)
            L56_1 = mp
            L56_1 = L56_1.CLEAN
            return L56_1
          end
        end
      end
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
