local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = {}
L1_1 = "cmd.exe"
L2_1 = "powershell.exe"
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = IsProcNameInParentProcessTree
L2_1 = "BM"
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.get_process_relationships
  L1_1, L2_1 = L1_1()
  L3_1 = ipairs
  L4_1 = L1_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.image_path
    if L8_1 ~= nil then
      L8_1 = bm
      L8_1 = L8_1.get_process_relationships
      L9_1 = L7_1.ppid
      L8_1, L9_1 = L8_1(L9_1)
      L10_1 = ipairs
      L11_1 = L8_1
      L10_1, L11_1, L12_1 = L10_1(L11_1)
      for L13_1, L14_1 in L10_1, L11_1, L12_1 do
        L15_1 = L14_1.image_path
        if L15_1 ~= nil then
          L15_1 = bm
          L15_1 = L15_1.add_related_file
          L16_1 = L14_1.image_path
          L15_1(L16_1)
        end
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
