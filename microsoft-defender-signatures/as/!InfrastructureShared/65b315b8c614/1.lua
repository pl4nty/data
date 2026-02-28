local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = "svchost.exe|taskeng.exe|taskhostw.exe"
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = string
    L9_1 = L9_1.match
    L10_1 = L6_1.image_path
    L11_1 = "\\([^\\]+)$"
    L9_1, L10_1, L11_1, L12_1 = L9_1(L10_1, L11_1)
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if L8_1 ~= nil then
      L9_1 = string
      L9_1 = L9_1.find
      L10_1 = L7_1
      L11_1 = L8_1
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 then
        L9_1 = TrackPidAndTechniqueBM
        L10_1 = "BM"
        L11_1 = "T1053.005"
        L12_1 = "schtask-target"
        L9_1(L10_1, L11_1, L12_1)
        L9_1 = mp
        L9_1 = L9_1.INFECTED
        return L9_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
