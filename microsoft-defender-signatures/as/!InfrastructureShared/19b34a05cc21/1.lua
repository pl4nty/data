local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L1_1 = {}
    L2_1 = "T1105:ingress_tool"
    L3_1 = "T1105:BmRDPFileCopyIn"
    L1_1[1] = L2_1
    L1_1[2] = L3_1
    L2_1 = TrackFileAndTechnique
    L3_1 = L0_1
    L4_1 = L1_1
    L2_1(L3_1, L4_1)
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
