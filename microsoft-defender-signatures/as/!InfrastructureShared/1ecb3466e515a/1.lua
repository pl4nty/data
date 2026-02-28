local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[7]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[7]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    goto lbl_39
  end
end
L0_1 = this_sigattrlog
L0_1 = L0_1[8]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[8]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    goto lbl_39
  end
end
L0_1 = this_sigattrlog
L0_1 = L0_1[9]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[9]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    goto lbl_39
  end
end
L0_1 = this_sigattrlog
L0_1 = L0_1[10]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[10]
  L0_1 = L0_1.utf8p2
end
::lbl_39::
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "Uri=([^;]+)"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = {}
  L2_1.SIG_CONTEXT = "BM"
  L2_1.CONTENT_SOURCE = "SUSPCOLORPL-C"
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "^https?://"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = SafeGetUrlReputation
    L4_1 = {}
    L5_1 = L1_1
    L4_1[1] = L5_1
    L5_1 = L2_1
    L6_1 = false
    L7_1 = 3000
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    L4_1 = L3_1.urls
    L4_1 = L4_1[L1_1]
    if L4_1 then
      L4_1 = L3_1.urls
      L4_1 = L4_1[L1_1]
      L4_1 = L4_1.determination
      if L4_1 == 2 then
        L4_1 = L3_1.urls
        L4_1 = L4_1[L1_1]
        L4_1 = L4_1.confidence
        if 60 <= L4_1 then
          L4_1 = mp
          L4_1 = L4_1.INFECTED
          return L4_1
        end
      end
    end
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
