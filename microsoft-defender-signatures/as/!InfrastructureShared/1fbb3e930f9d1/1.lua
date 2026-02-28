local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = string
L0_1 = L0_1.match
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.utf8p2
L2_1 = "regionsize:(%d+)"
L0_1 = L0_1(L1_1, L2_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tonumber
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 < 1024 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = this_sigattrlog
L2_1 = L2_1[9]
L2_1 = L2_1.utf8p1
L3_1 = ";"
L4_1 = this_sigattrlog
L4_1 = L4_1[9]
L4_1 = L4_1.utf8p2
L2_1 = L2_1 .. L3_1 .. L4_1
L3_1 = AppendToRollingQueue
L4_1 = "InjectionRelationship"
L5_1 = L1_1.ppid
L6_1 = L2_1
L7_1 = 3600
L8_1 = 1000
L9_1 = 0
L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L3_1 = this_sigattrlog
L3_1 = L3_1[7]
L3_1 = L3_1.utf8p2
L4_1 = bm
L4_1 = L4_1.trigger_sig
L5_1 = "BMGenCodeInjector.E"
L6_1 = L2_1
L7_1 = ";"
L8_1 = L3_1
L9_1 = ";"
L10_1 = tostring
L11_1 = bm
L11_1 = L11_1.get_sig_count
L11_1 = L11_1()
L10_1 = L10_1(L11_1)
L6_1 = L6_1 .. L7_1 .. L8_1 .. L9_1 .. L10_1
L4_1(L5_1, L6_1)
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
