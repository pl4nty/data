-- Threat: !InfrastructureShared
-- Name: 18896be8e872
-- Type: 21

-- Fallback: local variables were not recovered, registers are shown instead

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = pevars
L1_1 = L1_1.sigaddr
L2_1 = 4294967040
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 6291712 and L0_1 ~= 342700288 and L0_1 ~= 393031936 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.mmap_va
L2_1 = pevars
L2_1 = L2_1.sigaddr
L2_1 = L2_1 + 13
L3_1 = 1023
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 1
L3_1 = 0
L4_1 = 1
L5_1 = 0
L6_1 = 0
L7_1 = 0
L8_1 = 0
L9_1 = 0
while true do
  L10_1 = #L1_1
  if not (L2_1 < L10_1) then
    break
  end
  L10_1 = string
  L10_1 = L10_1.byte
  L11_1 = L1_1
  L12_1 = L2_1
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 == 232 then
    L3_1 = L3_1 + 1
    L2_1 = L2_1 + 5
  elseif L10_1 == 104 then
    L4_1 = L4_1 + 1
    L2_1 = L2_1 + 5
  elseif L10_1 == 131 then
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L1_1
    L13_1 = L2_1 + 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 == 248 or L11_1 == 224 then
      L2_1 = L2_1 + 3
    else
      if L11_1 == 196 then
        L12_1 = string
        L12_1 = L12_1.byte
        L13_1 = L1_1
        L14_1 = L2_1 + 2
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 == 4 then
          goto lbl_75
        end
      end
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      do return L12_1 end
      goto lbl_265
      ::lbl_75::
      L5_1 = L5_1 + 1
      L2_1 = L2_1 + 3
    end
  elseif L10_1 == 81 then
    L8_1 = L8_1 + 1
    L2_1 = L2_1 + 1
  elseif L10_1 == 80 then
    L9_1 = L9_1 + 1
    L2_1 = L2_1 + 1
  elseif L10_1 == 59 then
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L1_1
    L13_1 = L2_1 + 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 ~= 193 then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    L6_1 = L6_1 + 1
    L2_1 = L2_1 + 2
  elseif L10_1 == 15 then
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L1_1
    L13_1 = L2_1 + 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 == 132 then
      L7_1 = L7_1 + 1
      L2_1 = L2_1 + 6
    else
      L11_1 = string
      L11_1 = L11_1.byte
      L12_1 = L1_1
      L13_1 = L2_1 + 1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 == 133 then
        L2_1 = L2_1 + 6
      else
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
    end
  elseif L10_1 == 235 then
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L1_1
    L13_1 = L2_1 + 1
    L11_1 = L11_1(L12_1, L13_1)
    L12_1 = L2_1 + 2
    L2_1 = L12_1 + L11_1
  elseif L10_1 == 96 or L10_1 == 97 or L10_1 == 83 or L10_1 == 86 or L10_1 == 88 or L10_1 == 89 then
    L2_1 = L2_1 + 1
  elseif L10_1 == 116 or L10_1 == 106 or L10_1 == 117 then
    L2_1 = L2_1 + 2
  elseif L10_1 == 255 then
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L1_1
    L13_1 = L2_1 + 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 ~= 210 and L11_1 ~= 208 then
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      return L12_1
    end
    L2_1 = L2_1 + 2
  elseif L10_1 == 141 then
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L1_1
    L13_1 = L2_1 + 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 ~= 157 and L11_1 ~= 181 then
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      return L12_1
    end
    L2_1 = L2_1 + 6
  elseif L10_1 == 100 then
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L1_1
    L13_1 = L2_1 + 1
    L11_1 = L11_1(L12_1, L13_1)
    L12_1 = string
    L12_1 = L12_1.byte
    L13_1 = L1_1
    L14_1 = L2_1 + 2
    L12_1 = L12_1(L13_1, L14_1)
    if L11_1 == 255 and L12_1 == 53 or L11_1 == 137 and L12_1 == 37 or L11_1 == 143 and L12_1 == 5 then
      L2_1 = L2_1 + 7
    else
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
  elseif L10_1 == 139 then
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L1_1
    L13_1 = L2_1 + 1
    L11_1 = L11_1(L12_1, L13_1)
    L12_1 = string
    L12_1 = L12_1.byte
    L13_1 = L1_1
    L14_1 = L2_1 + 2
    L12_1 = L12_1(L13_1, L14_1)
    if L11_1 == 100 and L12_1 == 36 then
      L2_1 = L2_1 + 4
    elseif L11_1 == 133 then
      L2_1 = L2_1 + 6
    else
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
  elseif L10_1 == 137 then
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L1_1
    L13_1 = L2_1 + 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 ~= 133 then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    L2_1 = L2_1 + 6
  else
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
  ::lbl_265::
  if L3_1 == L5_1 and L6_1 == 1 and 0 < L7_1 and 0 < L8_1 and 0 < L9_1 and (L3_1 == L4_1 or 10 <= L3_1 and L3_1 < L4_1) then
    L11_1 = mp
    L11_1 = L11_1.INFECTED
    return L11_1
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
