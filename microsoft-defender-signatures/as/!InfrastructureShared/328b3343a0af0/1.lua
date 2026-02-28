local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = false
L1_1 = this_sigattrlog
L1_1 = L1_1[15]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[15]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    goto lbl_40
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[16]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[16]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    goto lbl_40
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[17]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[17]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    goto lbl_40
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[18]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[18]
  L1_1 = L1_1.utf8p2
end
::lbl_40::
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
if not L2_1 then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "DestIp=([^;]*);"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L4_1 = isPublicIP
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      goto lbl_67
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_67::
  L0_1 = true
end
L3_1 = {}
L3_1.SIG_CONTEXT = "DLL_LOAD_1"
L3_1.CONTENT_SOURCE = "BM"
L3_1.TAG = "INTERFLOW"
if not L0_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = "%."
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.CheckUrl
  L5_1 = L2_1
  L4_1, L5_1 = L4_1(L5_1)
  if L4_1 == 1 and L5_1 == 1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L4_1 = SafeGetUrlReputation
L5_1 = {}
L6_1 = L2_1
L5_1[1] = L6_1
L6_1 = L3_1
L7_1 = false
L8_1 = 2000
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L5_1 = L4_1.urls
L5_1 = L5_1[L2_1]
if L5_1 then
  L5_1 = L4_1.urls
  L5_1 = L5_1[L2_1]
  L5_1 = L5_1.determination
  if L5_1 == 2 then
    L5_1 = L4_1.urls
    L5_1 = L5_1[L2_1]
    L5_1 = L5_1.confidence
    if 60 <= L5_1 then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
