local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[14]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[14]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[14]
    L0_1 = L1_1.utf8p1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[15]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[15]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[15]
      L0_1 = L1_1.utf8p1
    end
  end
end
if L0_1 ~= nil then
  L1_1 = taint
  L2_1 = L0_1
  L3_1 = "remote_file_created_taint_specific"
  L4_1 = 3600
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1105"
  L4_1 = "CommandAndControl_IngressToolTransfer__RemoteFileCopy.A"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = bm
  L1_1 = L1_1.trigger_sig
  L2_1 = "RemoteFileCopy"
  L3_1 = L0_1
  L1_1(L2_1, L3_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
