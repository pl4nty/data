local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L0_1 then
  L1_1 = AppendToRollingQueue
  L2_1 = "PoshevinRelatedFiles"
  L3_1 = L0_1
  L4_1 = nil
  L5_1 = 5000
  L1_1(L2_1, L3_1, L4_1, L5_1)
end
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
if L2_1 ~= nil then
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.image_path
    if L8_1 ~= nil then
      L8_1 = L7_1.ppid
      if L8_1 ~= nil then
        L8_1 = TrackPidAndTechniqueBM
        L9_1 = L7_1.ppid
        L10_1 = "T1037"
        L11_1 = "possible_poshevin_child_a"
        L8_1(L9_1, L10_1, L11_1)
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
