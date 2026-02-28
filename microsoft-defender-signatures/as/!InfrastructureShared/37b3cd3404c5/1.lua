local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "name=!#(.-!dha);"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
    L2_1 = bm
    L2_1 = L2_1.add_related_string
    L3_1 = "vname"
    L4_1 = L1_1
    L5_1 = bm
    L5_1 = L5_1.RelatedStringBMReport
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = bm
    L2_1 = L2_1.trigger_sig_self_propagate
    L3_1 = "SuspChildProcessLaunch"
    L4_1 = L1_1
    L2_1(L3_1, L4_1)
    L2_1 = bm_AddRelatedFileFromCommandLine
    L3_1 = "BM"
    L4_1 = nil
    L5_1 = nil
    L6_1 = 1
    L2_1(L3_1, L4_1, L5_1, L6_1)
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
