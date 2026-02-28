local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = A0_2
  L2_2 = A0_2.byte
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = nil
    return L3_2
  end
  if L2_2 < 128 then
    L3_2 = L2_2
    L4_2 = A1_2 + 1
    return L3_2, L4_2
  end
  L3_2 = 0
  L4_2 = 0
  if 194 <= L2_2 and L2_2 <= 223 then
    L3_2 = 2
    L4_2 = 128
  elseif 224 <= L2_2 and L2_2 <= 239 then
    L3_2 = 3
    L4_2 = 2048
  elseif 240 <= L2_2 and L2_2 <= 244 then
    L3_2 = 4
    L4_2 = 65536
  else
    L5_2 = nil
    return L5_2
  end
  L5_2 = 8 - L3_2
  L5_2 = 2 ^ L5_2
  L5_2 = L2_2 % L5_2
  L6_2 = 2
  L7_2 = L3_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L11_2 = A0_2
    L10_2 = A0_2.byte
    L12_2 = A1_2 + L9_2
    L12_2 = L12_2 - 1
    L10_2 = L10_2(L11_2, L12_2)
    if not L10_2 or L10_2 < 128 or 191 < L10_2 then
      L11_2 = nil
      return L11_2
    end
    L11_2 = L5_2 * 64
    L12_2 = L10_2 % 64
    L5_2 = L11_2 + L12_2
  end
  if L4_2 > L5_2 then
    L6_2 = nil
    return L6_2
  end
  L6_2 = L5_2
  L7_2 = A1_2 + L3_2
  return L6_2, L7_2
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = 1
  L2_2 = 0
  while true do
    L3_2 = #A0_2
    if not (L1_2 <= L3_2) then
      break
    end
    L3_2 = L0_1
    L4_2 = A0_2
    L5_2 = L1_2
    L3_2, L4_2 = L3_2(L4_2, L5_2)
    if not L3_2 then
      break
    end
    if 119808 <= L3_2 and L3_2 <= 120831 then
      L2_2 = L2_2 + 1
      if 2 <= L2_2 then
        L5_2 = true
        return L5_2
      end
    end
    L1_2 = L4_2
  end
  L3_2 = false
  return L3_2
end

L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "[\128-\255]"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L1_1
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
