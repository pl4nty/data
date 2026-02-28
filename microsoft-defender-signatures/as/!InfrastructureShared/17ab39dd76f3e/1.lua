local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1040"
  L4_1 = "CredentialAccess_NetworkSniffing_SuspiciousProcess"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = addRelatedProcess
  L1_1()
  L1_1 = reportRelatedBmHits
  L1_1()
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if not L1_1 then
      L1_1 = sysio
      L1_1 = L1_1.IsFileExists
      L2_1 = L0_1
      L1_1 = L1_1(L2_1)
      if L1_1 then
        L1_1 = bm
        L1_1 = L1_1.add_related_file
        L2_1 = L0_1
        L1_1(L2_1)
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
