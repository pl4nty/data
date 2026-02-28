local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = 150000000
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if L0_1 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.wp2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L2_1 = L3_1.utf8p2
  end
end
if L2_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "base64"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = #L2_1
    if 200 <= L3_1 then
      L3_1 = TrackPidAndTechniqueBM
      L4_1 = "BM"
      L5_1 = "T1059.004"
      L6_1 = "Execution_PythonReverseShell"
      L3_1(L4_1, L5_1, L6_1)
      L3_1 = addRelatedProcess
      L3_1()
      L3_1 = reportRelatedBmHits
      L3_1()
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
