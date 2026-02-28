local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = L6_1.image_path
    L8_1 = L8_1(L9_1)
    L9_1 = "\\rundll32.exe"
    L10_1 = 1
    L11_1 = true
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    if L7_1 then
      L7_1 = mp
      L7_1 = L7_1.bitand
      L8_1 = L6_1.reason_ex
      L9_1 = bm
      L9_1 = L9_1.RELATIONSHIP_INJECTION
      L7_1 = L7_1(L8_1, L9_1)
      L8_1 = bm
      L8_1 = L8_1.RELATIONSHIP_INJECTION
      if L7_1 == L8_1 then
        L8_1 = TrackPidAndTechniqueBM
        L9_1 = L6_1.ppid
        L10_1 = "T1055.002"
        L11_1 = "processinjection_target"
        L8_1(L9_1, L10_1, L11_1)
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
