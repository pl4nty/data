local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p1
  end
end
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
  L2_1 = L0_1
  L1_1 = L0_1.gsub
  L3_1 = "\\shell\\open\\command"
  L4_1 = ""
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  L0_1 = L1_1
  L1_1 = sysio
  L1_1 = L1_1.RegExpandUserKey
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = pairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = AppendToRollingQueue
    L8_1 = "PoshevinRelatedRegistries"
    L9_1 = L6_1
    L10_1 = nil
    L11_1 = 5000
    L7_1(L8_1, L9_1, L10_1, L11_1)
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L1_1 then
  L2_1 = AppendToRollingQueue
  L3_1 = "PoshevinRelatedFiles"
  L4_1 = L1_1
  L5_1 = nil
  L6_1 = 5000
  L2_1(L3_1, L4_1, L5_1, L6_1)
end
L2_1 = bm
L2_1 = L2_1.get_process_relationships
L2_1, L3_1 = L2_1()
if L3_1 ~= nil then
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = L8_1.image_path
    if L9_1 ~= nil then
      L9_1 = L8_1.ppid
      if L9_1 ~= nil then
        L9_1 = TrackPidAndTechniqueBM
        L10_1 = L8_1.ppid
        L11_1 = "T1037"
        L12_1 = "possible_poshevin_child_d"
        L9_1(L10_1, L11_1, L12_1)
        L9_1 = mp
        L9_1 = L9_1.INFECTED
        return L9_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
