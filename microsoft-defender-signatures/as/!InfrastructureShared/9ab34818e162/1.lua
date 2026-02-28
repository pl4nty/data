local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= nil then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[1]
      L0_1 = L0_1.utf8p2
      L2_1 = L0_1
      L1_1 = L0_1.match
      L3_1 = "RemoteIp:([^;]+)"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 ~= nil and L1_1 ~= "" then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = L1_1
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
        L2_1 = TrackAttackerServer
        L3_1 = L1_1
        L2_1(L3_1)
        L2_1 = AddResearchData
        L3_1 = "BM"
        L4_1 = true
        L2_1(L3_1, L4_1)
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
