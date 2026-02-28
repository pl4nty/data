local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = L6_1.ppid
    if L7_1 ~= nil then
      L7_1 = contains
      L8_1 = L6_1.image_path
      L9_1 = {}
      L10_1 = "rundll32, regsvr32"
      L9_1[1] = L10_1
      L7_1 = L7_1(L8_1, L9_1)
      if L7_1 then
        L7_1 = extractDllForRegproc
        L8_1 = L6_1.cmd_line
        L7_1 = L7_1(L8_1)
        if L7_1 then
          L8_1 = bm
          L8_1 = L8_1.add_related_file
          L9_1 = L7_1
          L8_1(L9_1)
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
