local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
L1_1 = string
L1_1 = L1_1.lower
L2_1 = string
L2_1 = L2_1.sub
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILENAME
L3_1 = L3_1(L4_1)
L4_1 = -3
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = string
L3_1 = L3_1.sub
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILENAME
L4_1 = L4_1(L5_1)
L5_1 = -4
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L1_1 ~= ".js" and L2_1 ~= ".vbs" and L2_1 ~= ".ps1" and L2_1 ~= ".wsf" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = BuildTokenCountHistogram
L3_1 = L3_1()
L4_1 = L3_1[1]
if L4_1 == 0 or L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L3_1[2]
L6_1 = 0
L7_1 = 0
L8_1 = pairs
L9_1 = L5_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  if L11_1 ~= nil then
    if L12_1 > L6_1 then
      L7_1 = L6_1
      L6_1 = L12_1
    elseif L12_1 < L6_1 and L12_1 > L7_1 then
      L7_1 = L12_1
    end
  end
end
L8_1 = L6_1 * 100
L8_1 = L8_1 / L4_1
if not (40 <= L8_1) then
  L8_1 = L6_1 + L7_1
  L8_1 = L8_1 * 100
  L8_1 = L8_1 / L4_1
  if not (70 <= L8_1) then
    goto lbl_95
  end
end
L8_1 = mp
L8_1 = L8_1.INFECTED
do return L8_1 end
::lbl_95::
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
