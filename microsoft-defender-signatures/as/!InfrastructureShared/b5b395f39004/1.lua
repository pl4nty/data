local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = ""
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L0_1 = L1_1.utf8p2
end
L1_1 = "(http|https|ftp|smb|unc):[\\\\/]{2}((0x[0-9a-f]{6,8})|(((\\d{4})|(0x[0-9a-f]{2}))\\.){3}((\\d{4})|(0x[0-9a-f]{2}))|\\d{8,10})[\\\\/]{1}"
L2_1 = MpCommon
L2_1 = L2_1.StringRegExpSearch
L3_1 = L1_1
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == true then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
