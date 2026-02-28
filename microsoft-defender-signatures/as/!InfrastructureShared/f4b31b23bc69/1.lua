local L0_1, L1_1, L2_1, L3_1, L4_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.ppid
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L0_1 = L2_1
      L2_1 = this_sigattrlog
      L2_1 = L2_1[1]
      L1_1 = L2_1.ppid
    end
  end
end
if L0_1 ~= nil then
  L2_1 = #L0_1
  if not (L2_1 < 3) and L1_1 ~= nil then
    goto lbl_36
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_36::
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "/%.[^/]+$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = IsDiscoveryCollectionThresholdMetLinux
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = addRelatedProcess
    L2_1()
    L2_1 = reportRelatedBmHits
    L2_1()
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
