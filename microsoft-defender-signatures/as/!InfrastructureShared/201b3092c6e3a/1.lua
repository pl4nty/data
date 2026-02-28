local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[12]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = nil
  L1_1 = this_sigattrlog
  L1_1 = L1_1[12]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[12]
    L0_1 = L1_1.utf8p2
  end
  if L0_1 == nil or L0_1 == "" then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = " -G sudo "
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = " -G sudo,"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = " -G%s[%w]+,sudo%s"
      L4_1 = 1
      L5_1 = false
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = " -G%s[%w]+,sudo,"
        L4_1 = 1
        L5_1 = false
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = " -G%s[%w]+[,%w]+,sudo%s"
          L4_1 = 1
          L5_1 = false
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = " -G%s[%w]+[,%w]+,sudo,"
            L4_1 = 1
            L5_1 = false
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              goto lbl_84
            end
          end
        end
      end
    end
  end
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1136"
  L4_1 = "Persistence_CreateAccount"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  do return L1_1 end
  ::lbl_84::
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1548.003"
L3_1 = "PrivilegeEscalation"
L0_1(L1_1, L2_1, L3_1)
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1078.003"
L3_1 = "Persistence"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
