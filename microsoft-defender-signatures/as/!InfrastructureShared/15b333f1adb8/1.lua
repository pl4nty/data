local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = false
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
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
            L11_1 = "T1548.002"
            L12_1 = "uac_bypass_trg"
            L9_1(L10_1, L11_1, L12_1)
            L0_1 = true
          end
        end
      end
    end
  end
end
if L0_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
