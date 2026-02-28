local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.GetHSTRCallerId
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.HSTR_CALLER_SMS
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L0_2 = mp
  L0_2 = L0_2.GetSMSMemRanges
  L0_2 = L0_2()
  L1_2 = ipairs
  L2_2 = mp
  L2_2 = L2_2.hstr_full_log
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L2_2()
  L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = L5_2.matched
    if L6_2 then
      L6_2 = isSafeToRead
      L7_2 = L0_2
      L8_2 = L5_2.VA
      L9_2 = 16
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      if L6_2 then
        L6_2 = mp
        L6_2 = L6_2.ReadProcMem
        L7_2 = L5_2.VA
        L8_2 = 16
        L6_2 = L6_2(L7_2, L8_2)
        L7_2 = mp
        L7_2 = L7_2.readu_u16
        L8_2 = L6_2
        L9_2 = 1
        L7_2 = L7_2(L8_2, L9_2)
        if L7_2 == 53643 then
          L7_2 = mp
          L7_2 = L7_2.readu_u32
          L8_2 = L6_2
          L9_2 = 6
          L7_2 = L7_2(L8_2, L9_2)
          L8_2 = L5_2.VA
          L7_2 = L7_2 + L8_2
          L7_2 = L7_2 + 9
          L8_2 = isSafeToRead
          L9_2 = L0_2
          L10_2 = L7_2
          L11_2 = 512
          L8_2 = L8_2(L9_2, L10_2, L11_2)
          if L8_2 then
            L8_2 = mp
            L8_2 = L8_2.ReadProcMem
            L9_2 = L7_2
            L10_2 = 512
            L8_2 = L8_2(L9_2, L10_2)
            L6_2 = L8_2
            L8_2 = mp
            L8_2 = L8_2.readu_u64
            L9_2 = L6_2
            L10_2 = 1
            L8_2 = L8_2(L9_2, L10_2)
            L9_2 = isSafeToRead
            L10_2 = L0_2
            L11_2 = L8_2
            L12_2 = 4
            L9_2 = L9_2(L10_2, L11_2, L12_2)
            if not L9_2 then
              L9_2 = mp
              L9_2 = L9_2.bsplit
              L10_2 = mp
              L10_2 = L10_2.bitand
              L11_2 = mp
              L11_2 = L11_2.shr64
              L12_2 = L7_2
              L13_2 = 32
              L11_2 = L11_2(L12_2, L13_2)
              L12_2 = 4294967295
              L10_2 = L10_2(L11_2, L12_2)
              L11_2 = 8
              L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2, L11_2)
              L13_2 = string
              L13_2 = L13_2.char
              L14_2 = mp
              L14_2 = L14_2.bitxor
              L16_2 = L6_2
              L15_2 = L6_2.byte
              L17_2 = 5
              L15_2 = L15_2(L16_2, L17_2)
              L16_2 = L9_2
              L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L14_2(L15_2, L16_2)
              L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
              L14_2 = string
              L14_2 = L14_2.char
              L15_2 = mp
              L15_2 = L15_2.bitxor
              L17_2 = L6_2
              L16_2 = L6_2.byte
              L18_2 = 6
              L16_2 = L16_2(L17_2, L18_2)
              L17_2 = L10_2
              L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L15_2(L16_2, L17_2)
              L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
              L15_2 = string
              L15_2 = L15_2.char
              L16_2 = mp
              L16_2 = L16_2.bitxor
              L18_2 = L6_2
              L17_2 = L6_2.byte
              L19_2 = 7
              L17_2 = L17_2(L18_2, L19_2)
              L18_2 = L11_2
              L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L16_2(L17_2, L18_2)
              L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
              L16_2 = string
              L16_2 = L16_2.char
              L17_2 = mp
              L17_2 = L17_2.bitxor
              L19_2 = L6_2
              L18_2 = L6_2.byte
              L20_2 = 8
              L18_2 = L18_2(L19_2, L20_2)
              L19_2 = L12_2
              L17_2, L18_2, L19_2, L20_2, L21_2 = L17_2(L18_2, L19_2)
              L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
              L13_2 = L13_2 .. L14_2 .. L15_2 .. L16_2
              L14_2 = "([\\x00-\\xFF]+)"
              L15_2 = L13_2
              L14_2 = L14_2 .. L15_2
              L15_2 = MpCommon
              L15_2 = L15_2.BinaryRegExpSearch
              L16_2 = L14_2
              L17_2 = L6_2
              L15_2, L16_2 = L15_2(L16_2, L17_2)
              if not L15_2 then
                break
              end
              L17_2 = mp
              L17_2 = L17_2.bitxor
              L18_2 = mp
              L18_2 = L18_2.readu_u64
              L19_2 = L6_2
              L20_2 = #L16_2
              L20_2 = L20_2 - 3
              L18_2 = L18_2(L19_2, L20_2)
              L19_2 = mp
              L19_2 = L19_2.readu_u64
              L20_2 = L6_2
              L21_2 = 1
              L19_2, L20_2, L21_2 = L19_2(L20_2, L21_2)
              L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
              L8_2 = L17_2
              L17_2 = isSafeToRead
              L18_2 = L0_2
              L19_2 = L8_2
              L20_2 = 4
              L17_2 = L17_2(L18_2, L19_2, L20_2)
              if not L17_2 then
                break
              end
            end
            L9_2 = reportDetectedRegions
            L10_2 = {}
            L11_2 = L8_2
            L12_2 = L7_2
            L13_2 = L5_2.VA
            L10_2[1] = L11_2
            L10_2[2] = L12_2
            L10_2[3] = L13_2
            L9_2(L10_2)
          end
        end
      end
    end
  end
end

L1_1 = pcallEx
L2_1 = "get_regions"
L3_1 = L0_1
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
