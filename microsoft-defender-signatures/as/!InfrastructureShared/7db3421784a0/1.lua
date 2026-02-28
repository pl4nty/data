local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = "webservice_childproc"
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L0_1 = "webserver_childproc"
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L0_1 = "dbservice_childproc"
    end
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = mp
  L8_1 = L8_1.bitand
  L9_1 = L7_1.reason_ex
  L10_1 = 1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 == 1 then
    L8_1 = TrackPidAndTechniqueBM
    L9_1 = L7_1.ppid
    L10_1 = "T1190"
    L11_1 = L0_1
    L12_1 = 7200
    L8_1(L9_1, L10_1, L11_1, L12_1)
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
