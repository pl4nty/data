local L0_1, L1_1, L2_1, L3_1, L4_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.wp2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.utf8p2
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.wp2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L1_1 = L2_1.utf8p2
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.wp2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L1_1 = L2_1.utf8p2
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.wp2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L1_1 = L2_1.utf8p2
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.wp2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L1_1 = L2_1.utf8p2
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[6]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.wp2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L1_1 = L2_1.utf8p2
  end
end
if L0_1 and L1_1 then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "[/\\]admin$"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == nil then
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L1_1
    L4_1 = "[/\\][a-z]$"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == nil then
      goto lbl_124
    end
  end
  L2_1 = isTainted
  L3_1 = L0_1
  L4_1 = "remote_file_created_taint"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
::lbl_124::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
