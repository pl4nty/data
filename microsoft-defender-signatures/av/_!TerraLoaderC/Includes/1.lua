local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = pe
L0_1 = L0_1.get_exports
L0_1, L1_1 = L0_1()
if L0_1 == 0 or L1_1 == nil or 32 < L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = ""
L3_1 = {}
L4_1 = 0
L5_1 = 0

function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = #A0_2
  if L1_2 < 2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = {}
  L2_2 = "8"
  L3_2 = "16"
  L4_2 = "32"
  L5_2 = "64"
  L6_2 = "128"
  L7_2 = "256"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = "([a-zA-Z])"
    L8_2 = L6_2
    L9_2 = "$"
    L7_2 = L7_2 .. L8_2 .. L9_2
    L8_2 = string
    L8_2 = L8_2.match
    L9_2 = A0_2
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 then
      L8_2 = true
      return L8_2
    end
  end
  L2_2 = false
  return L2_2
end

L7_1 = mp
L7_1 = L7_1.readprotection
L8_1 = false
L7_1(L8_1)
L7_1 = 1
L8_1 = L0_1
L9_1 = 1
for L10_1 = L7_1, L8_1, L9_1 do
  L11_1 = pe
  L11_1 = L11_1.mmap_string_rva
  L12_1 = L1_1[L10_1]
  L12_1 = L12_1.namerva
  L13_1 = 64
  L11_1 = L11_1(L12_1, L13_1)
  L2_1 = L11_1
  if L2_1 ~= nil then
    L11_1 = pe
    L11_1 = L11_1.mmap_rva_nofastfail
    L12_1 = L1_1[L10_1]
    L12_1 = L12_1.rva
    L13_1 = 3
    L11_1 = L11_1(L12_1, L13_1)
    L3_1 = L11_1
    L11_1 = #L3_1
    if L11_1 ~= 3 then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L3_1
    L13_1 = 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 == 49 then
      L11_1 = string
      L11_1 = L11_1.byte
      L12_1 = L3_1
      L13_1 = 2
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 == 192 then
        L11_1 = string
        L11_1 = L11_1.byte
        L12_1 = L3_1
        L13_1 = 3
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 == 195 then
          L4_1 = L4_1 + 1
          L11_1 = L6_1
          L12_1 = L2_1
          L11_1 = L11_1(L12_1)
          if L11_1 then
            L5_1 = L5_1 + 1
          end
        end
      end
    end
  end
end
L7_1 = mp
L7_1 = L7_1.readprotection
L8_1 = true
L7_1(L8_1)
if not (L4_1 < 9) then
  L7_1 = L4_1 / 2
  if not (L5_1 < L7_1) then
    goto lbl_89
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_89::
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
