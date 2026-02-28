local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = ""
L1_1 = this_sigattrlog
L1_1 = L1_1[9]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[9]
  L1_1 = L1_1.utf8p2
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "Uri=([^;]+)"
L2_1 = L2_1(L3_1, L4_1)
L0_1 = L2_1
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L2_1.SIG_CONTEXT = "LummaC2_lolbin"
L2_1.CONTENT_SOURCE = "BM"
L2_1.TAG = "INTERFLOW"
L3_1 = mp
L3_1 = L3_1.CheckUrl
L4_1 = L0_1
L3_1, L4_1 = L3_1(L4_1)
if L3_1 == 1 and L4_1 == 1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = SafeGetUrlReputation
L6_1 = {}
L7_1 = L0_1
L6_1[1] = L7_1
L7_1 = L2_1
L8_1 = false
L9_1 = 2000
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
L6_1 = L5_1.urls
L6_1 = L6_1[L0_1]
if L6_1 then
  L6_1 = L5_1.urls
  L6_1 = L6_1[L0_1]
  L6_1 = L6_1.determination
  if L6_1 == 2 then
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = L5_1.urls
L6_1 = L6_1[L0_1]
if L6_1 then
  L6_1 = L5_1.urls
  L6_1 = L6_1[L0_1]
  L6_1 = L6_1.determination
  if L6_1 then
    L6_1 = L5_1.urls
    L6_1 = L6_1[L0_1]
    L6_1 = L6_1.determination
    if L6_1 == 1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = L5_1.urls
    L6_1 = L6_1[L0_1]
    L6_1 = L6_1.determination
    if L6_1 == 4 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = bm
    L6_1 = L6_1.trigger_sig
    L7_1 = "LummaC2_lolbin_All_1"
    L8_1 = tostring
    L9_1 = L5_1.urls
    L9_1 = L9_1[L0_1]
    L9_1 = L9_1.determination
    L8_1, L9_1 = L8_1(L9_1)
    L6_1(L7_1, L8_1, L9_1)
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
