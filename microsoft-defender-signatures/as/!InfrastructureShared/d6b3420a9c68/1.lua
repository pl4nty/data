local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    goto lbl_39
  end
end
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    goto lbl_39
  end
end
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    goto lbl_39
  end
end
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.utf8p2
end
::lbl_39::
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "Uri=([^;]+)"
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = isValidLocalDomain
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CheckUrl
    L3_1 = L1_1
    L2_1, L3_1 = L2_1(L3_1)
    if L2_1 == 1 and L3_1 == 1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = {}
    L4_1.SIG_CONTEXT = "BM"
    L4_1.CONTENT_SOURCE = "ZERODAY-OBVIOUSLY"
    L4_1.PROCESS_CONTEXT = "PE"
    L4_1.FILELESS = "true"
    L4_1.CMDLINE_URL = "true"
    L5_1 = string
    L5_1 = L5_1.match
    L6_1 = L1_1
    L7_1 = "^https?://"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = SafeGetUrlReputation
      L6_1 = {}
      L7_1 = L1_1
      L6_1[1] = L7_1
      L7_1 = L4_1
      L8_1 = false
      L9_1 = 3000
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      L6_1 = L5_1.urls
      L6_1 = L6_1[L1_1]
      if L6_1 then
        L6_1 = L5_1.urls
        L6_1 = L6_1[L1_1]
        L6_1 = L6_1.determination
        if L6_1 == 2 then
          L6_1 = L5_1.urls
          L6_1 = L6_1[L1_1]
          L6_1 = L6_1.confidence
          if 60 <= L6_1 then
            L6_1 = mp
            L6_1 = L6_1.INFECTED
            return L6_1
          end
        end
      end
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
