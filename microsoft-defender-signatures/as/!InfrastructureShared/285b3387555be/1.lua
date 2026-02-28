local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[6]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 then
  L1_1 = pcall
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L0_1
  L4_1 = "fsize:(%d+)"
  L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 then
    L3_1 = isnull
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      goto lbl_36
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_36::
  L3_1 = tonumber
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  if L2_1 and 1000 <= L2_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
