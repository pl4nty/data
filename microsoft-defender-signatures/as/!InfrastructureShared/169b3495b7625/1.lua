local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= "" then
      goto lbl_19
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  do return L1_1 end
  ::lbl_19::
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L0_1 = L1_1.utf8p2
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "[%s%/]%.npl$"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
if L2_1 ~= nil then
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = bm
    L8_1 = L8_1.trigger_sig
    L9_1 = "BmTraverseTreeBlockMac"
    L10_1 = "Detected"
    L11_1 = L7_1.ppid
    L8_1(L9_1, L10_1, L11_1)
  end
end
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1059"
L6_1 = "Execution_CommandAndScriptingInterpreter_ExactMatch"
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
