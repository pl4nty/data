local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[5]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= "" then
      L0_1 = string
      L0_1 = L0_1.lower
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.utf8p2
      L0_1 = L0_1(L1_1)
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = " -a "
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "admin"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if L1_1 then
          L1_1 = TrackPidAndTechniqueBM
          L2_1 = "BM"
          L3_1 = "T1078"
          L4_1 = "PrivilegeEscalation_adminAcc_dseditgroup"
          L1_1(L2_1, L3_1, L4_1)
          L1_1 = mp
          L1_1 = L1_1.INFECTED
          return L1_1
        end
      end
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1078"
L3_1 = "PrivilegeEscalation_adminAcc_dscl"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
