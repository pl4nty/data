local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "/s[%s]?$"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L1_1 = L2_1.utf8p1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L1_1 = L2_1.utf8p1
  end
end
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = AppendToRollingQueue
  L3_1 = "PoshevinRelatedFiles"
  L4_1 = L1_1
  L5_1 = nil
  L6_1 = 5000
  L2_1(L3_1, L4_1, L5_1, L6_1)
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L3_1()
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L2_1 then
  L3_1 = AppendToRollingQueue
  L4_1 = "PoshevinRelatedFiles"
  L5_1 = L2_1
  L6_1 = nil
  L7_1 = 5000
  L3_1(L4_1, L5_1, L6_1, L7_1)
end
L3_1 = bm
L3_1 = L3_1.get_process_relationships
L3_1, L4_1 = L3_1()
if L4_1 ~= nil then
  L5_1 = ipairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L9_1.image_path
    if L10_1 ~= nil then
      L10_1 = L9_1.ppid
      if L10_1 ~= nil then
        L10_1 = TrackPidAndTechniqueBM
        L11_1 = L9_1.ppid
        L12_1 = "T1037"
        L13_1 = "possible_poshevin_child_b"
        L10_1(L11_1, L12_1, L13_1)
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
