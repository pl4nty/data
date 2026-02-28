local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= "" then
      goto lbl_19
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_19::
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= "" then
      goto lbl_37
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_37::
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L0_1 = L3_1.utf8p1
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L1_1 = L3_1.utf8p2
L3_1 = string
L3_1 = L3_1.match
L4_1 = L0_1
L5_1 = "[^/]+%.sh$"
L3_1 = L3_1(L4_1, L5_1)
L2_1 = L3_1
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = bm
    L3_1 = L3_1.add_threat_file
    L4_1 = L0_1
    L3_1(L4_1)
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
