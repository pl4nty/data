local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = 1
L4_1 = L0_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = sigattr_tail
  L7_1 = L7_1[L6_1]
  L7_1 = L7_1.attribute
  if L7_1 == 16384 then
    L7_1 = sigattr_tail
    L7_1 = L7_1[L6_1]
    L7_1 = L7_1.utf8p1
    if L7_1 then
      L7_1 = sigattr_tail
      L7_1 = L7_1[L6_1]
      L7_1 = L7_1.utf8p1
      L8_1 = L7_1
      L7_1 = L7_1.byte
      L9_1 = 1
      L7_1 = L7_1(L8_1, L9_1)
      if L7_1 ~= 37 then
        L7_1 = sigattr_tail
        L7_1 = L7_1[L6_1]
        L7_1 = L7_1.utf8p1
        L8_1 = L1_1[L7_1]
        if L8_1 == nil then
          L1_1[L7_1] = L6_1
        end
      end
    end
  end
end
L3_1 = pairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = false
  L9_1 = 1
  L10_1 = L0_1
  L11_1 = 1
  for L12_1 = L9_1, L10_1, L11_1 do
    L13_1 = sigattr_tail
    L13_1 = L13_1[L12_1]
    L13_1 = L13_1.attribute
    if L13_1 == 16389 then
      L13_1 = sigattr_tail
      L13_1 = L13_1[L12_1]
      L13_1 = L13_1.utf8p1
      if L13_1 == L6_1 then
        L8_1 = true
        break
      end
    end
  end
  if L8_1 == false then
    L2_1[L6_1] = 1
  end
end
L3_1 = pairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = mp
  L8_1 = L8_1.TriggerScanResource
  L9_1 = "file"
  L10_1 = L6_1
  L8_1(L9_1, L10_1)
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
