local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = 0
L1_1 = ""
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.reg_new_value_size
    if 10000 < L0_1 then
      L2_1 = tohex
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "436F7079726967687420284329204D6963726F736F667420436F72706F726174696F6E2E0AE9"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 then
        L2_1 = bm
        L2_1 = L2_1.trigger_sig_delayed
        L3_1 = "Behavior:Win32/RegsetShellbin.rescan"
        L4_1 = this_sigattrlog
        L4_1 = L4_1[1]
        L4_1 = L4_1.utf8p1
        L5_1 = 5000
        L2_1(L3_1, L4_1, L5_1)
        L2_1 = mp
        L2_1 = L2_1.TriggerScanResource
        L3_1 = "file"
        L4_1 = "c:\\Windows\\Temp\\tmp8AB2.tmp"
        L5_1 = 0
        L6_1 = 5000
        L2_1(L3_1, L4_1, L5_1, L6_1)
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
