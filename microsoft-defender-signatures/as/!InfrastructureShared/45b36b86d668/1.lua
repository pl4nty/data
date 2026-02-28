local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.DisableSignature
L0_1()

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = 0
  L2_2 = 1
  L3_2 = 255
  while L2_2 <= L3_2 do
    L5_2 = A0_2
    L4_2 = A0_2.byte
    L6_2 = L2_2
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      break
    end
    L6_2 = A0_2
    L5_2 = A0_2.byte
    L7_2 = L2_2 + 1
    L8_2 = L2_2 + 3
    L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2, L8_2)
    L8_2 = nil
    if 240 <= L4_2 and L4_2 <= 244 and L5_2 and L6_2 and L7_2 then
      L9_2 = L4_2 - 240
      L9_2 = L9_2 * 262144
      L10_2 = L5_2 - 128
      L10_2 = L10_2 * 4096
      L9_2 = L9_2 + L10_2
      L10_2 = L6_2 - 128
      L10_2 = L10_2 * 64
      L9_2 = L9_2 + L10_2
      L10_2 = L7_2 - 128
      L8_2 = L9_2 + L10_2
      L2_2 = L2_2 + 4
    elseif 224 <= L4_2 and L4_2 <= 239 and L5_2 and L6_2 then
      L9_2 = L4_2 - 224
      L9_2 = L9_2 * 4096
      L10_2 = L5_2 - 128
      L10_2 = L10_2 * 64
      L9_2 = L9_2 + L10_2
      L10_2 = L6_2 - 128
      L8_2 = L9_2 + L10_2
      L2_2 = L2_2 + 3
    elseif 192 <= L4_2 and L4_2 <= 223 and L5_2 then
      L9_2 = L4_2 - 192
      L9_2 = L9_2 * 64
      L10_2 = L5_2 - 128
      L8_2 = L9_2 + L10_2
      L2_2 = L2_2 + 2
    else
      L8_2 = L4_2
      L2_2 = L2_2 + 1
    end
    if L8_2 and 127 < L8_2 then
      L1_2 = L1_2 + 1
    end
  end
  return L1_2
end

count_nonascii_charset = L0_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L0_1 = L0_1.ppid
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.GetProcessCommandLine
  L3_1 = L0_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
    L2_1 = 0
    L3_1 = count_nonascii_charset
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    if 0 < L2_1 then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
