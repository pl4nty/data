local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
      L0_1 = string
      L0_1 = L0_1.lower
      L1_1 = this_sigattrlog
      L1_1 = L1_1[1]
      L1_1 = L1_1.utf8p1
      L0_1 = L0_1(L1_1)
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[1]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L3_1 = L1_1
      L2_1 = L1_1.match
      L4_1 = "remoteip:([^;]+)"
      L2_1 = L2_1(L3_1, L4_1)
      if (L2_1 ~= nil or L2_1 ~= "" or L2_1 ~= ";fsize") and L0_1 ~= "" then
        L3_1 = TrackAttackerServer
        L4_1 = L2_1
        L5_1 = 5000
        L3_1(L4_1, L5_1)
        L3_1 = string
        L3_1 = L3_1.lower
        L4_1 = MpCommon
        L4_1 = L4_1.PathToWin32Path
        L5_1 = L0_1
        L4_1, L5_1, L6_1 = L4_1(L5_1)
        L3_1 = L3_1(L4_1, L5_1, L6_1)
        L0_1 = L3_1
        L3_1 = {}
        L4_1 = "T1570:remote_dropped_FePyDll"
        L5_1 = "T1021.002:remote_dropped_FePyDll"
        L3_1[1] = L4_1
        L3_1[2] = L5_1
        L4_1 = TrackFileAndTechnique
        L5_1 = L0_1
        L6_1 = L3_1
        L4_1(L5_1, L6_1)
        L4_1 = AddResearchData
        L5_1 = "BM"
        L6_1 = true
        L4_1(L5_1, L6_1)
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
