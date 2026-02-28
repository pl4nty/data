local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = isFirstTimeATActive
L0_1 = L0_1()
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = 1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.matched
  if L1_1 then
    L0_1 = 3
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[6]
    L1_1 = L1_1.matched
    if L1_1 then
      L0_1 = 98
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[7]
      L1_1 = L1_1.matched
      if L1_1 then
        L0_1 = 99
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[8]
        L1_1 = L1_1.matched
        if L1_1 then
          L0_1 = 109
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[9]
          L1_1 = L1_1.matched
          if L1_1 then
            L0_1 = 110
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[10]
            L1_1 = L1_1.matched
            if L1_1 then
              L0_1 = 111
            end
          end
        end
      end
    end
  end
end
L1_1 = tonumber
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.utf8p2
L1_1 = L1_1(L2_1)
L2_1 = math_floor
L3_1 = L0_1 / 100
L2_1 = L2_1(L3_1)
L2_1 = L2_1 + 1
L3_1 = updateFTATData
L4_1 = L2_1
L5_1 = L0_1
L6_1 = L1_1
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
if L4_1 < 604800 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "FirstTime"
L7_1 = L3_1
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = bm
L5_1 = L5_1.set_detection_string
L6_1 = L3_1
L5_1(L6_1)
L5_1 = bm
L5_1 = L5_1.get_process_relationships
L5_1, L6_1 = L5_1()
L7_1 = ipairs
L8_1 = L6_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = mp
  L12_1 = L12_1.bitand
  L13_1 = L11_1.reason_ex
  L14_1 = 1
  L12_1 = L12_1(L13_1, L14_1)
  L13_1 = L11_1.ppid
  if L13_1 ~= nil then
    L13_1 = L11_1.image_path
    if L13_1 ~= nil and L12_1 == 1 then
      L13_1 = bm
      L13_1 = L13_1.add_related_file
      L14_1 = L11_1.image_path
      L13_1(L14_1)
    end
  end
end
L7_1 = add_parents
L7_1()
L7_1 = reportSessionInformation
L7_1()
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
