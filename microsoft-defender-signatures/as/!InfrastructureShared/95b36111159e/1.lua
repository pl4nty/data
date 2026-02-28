local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    L2_1 = L1_1
    L1_1 = L1_1.lower
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L1_1 = L1_1.utf8p2
      L2_1 = L1_1
      L1_1 = L1_1.lower
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    end
  end
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = "werfault.exe"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = StringEndsWith
  L2_1 = L0_1
  L3_1 = "wermgr.exe"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    goto lbl_56
  end
end
L1_1 = triggerMemoryScanOnProcessTree
L2_1 = true
L3_1 = true
L4_1 = "SMS_M"
L5_1 = 1000
L6_1 = "Behavior:Win32/WerInject.SA"
L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_56::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
