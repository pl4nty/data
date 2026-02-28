local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = pe
L0_1 = L0_1.get_imports
L0_1, L1_1 = L0_1()
if L1_1 == nil or L0_1 < 8 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = {}
L7_1 = {}
L8_1 = true
L9_1 = "Rhysida"
L7_1[1] = L8_1
L7_1[2] = L9_1
L6_1[836405768] = L7_1
L5_1[2744197095] = L6_1
L4_1[689456874] = L5_1
L3_1[150799487] = L4_1
L2_1[3582934083] = L3_1
L3_1 = 1
L4_1 = L0_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = L1_1[L6_1]
  L7_1 = L7_1.fn
  L7_1 = L2_1[L7_1]
  if L7_1 ~= nil then
    L7_1 = L2_1
    L8_1 = 0
    L9_1 = L0_1 - L6_1
    L10_1 = 1
    for L11_1 = L8_1, L9_1, L10_1 do
      L12_1 = L6_1 + L11_1
      L12_1 = L1_1[L12_1]
      L12_1 = L12_1.fn
      L7_1 = L7_1[L12_1]
      if L7_1 == nil then
        break
      else
        L12_1 = L7_1[1]
        if L12_1 == true then
          L12_1 = L7_1[2]
          if L12_1 ~= nil then
            L12_1 = mp
            L12_1 = L12_1.set_mpattribute
            L13_1 = "ImportSequenceSignature_"
            L14_1 = L7_1[2]
            L13_1 = L13_1 .. L14_1
            L12_1(L13_1)
          end
          L12_1 = mp
          L12_1 = L12_1.INFECTED
          return L12_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
