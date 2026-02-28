local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = {}
L1_1 = "rundll32.exe"
L2_1 = "regsvr32.exe"
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = L7_1.image_path
  if L8_1 ~= nil then
    L8_1 = contains
    L9_1 = L7_1.image_path
    L10_1 = L0_1
    L8_1 = L8_1(L9_1, L10_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    else
      L8_1 = MpCommon
      L8_1 = L8_1.GetOriginalFileName
      L9_1 = L7_1.image_path
      L8_1 = L8_1(L9_1)
      L9_1 = contains
      L10_1 = L8_1
      L11_1 = L0_1
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 then
        L9_1 = mp
        L9_1 = L9_1.INFECTED
        return L9_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
