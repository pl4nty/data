local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = ""
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = MpCommon
L2_1 = L2_1.QueryPersistContext
L3_1 = L1_1
L4_1 = "NewPECreatedNoCert"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = checkFileLastWriteTime
L4_1 = L1_1
L5_1 = 600
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= false then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.IsKnownFriendlyFile
L4_1 = L1_1
L5_1 = true
L6_1 = false
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[7]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L3_1 = L3_1.utf8p2
end
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "Uri=([^;]+)"
L4_1 = L4_1(L5_1, L6_1)
L0_1 = L4_1
if not L0_1 then
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L3_1
  L6_1 = "DestIp=([^;]*);"
  L4_1 = L4_1(L5_1, L6_1)
  L0_1 = L4_1
end
if not L0_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L0_1
L4_1 = L0_1.match
L6_1 = "(%d+%.%d+%.%d+%.%d+)"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L5_1 = isPublicIP
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L6_1 = L0_1
L5_1 = L0_1.find
L7_1 = "%."
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L6_1 = L0_1
L5_1 = L0_1.match
L7_1 = "^([^:/?#]+)://(.+)$"
L5_1, L6_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L7_1 = "http://"
  L8_1 = L0_1
  L0_1 = L7_1 .. L8_1
end
L7_1 = {}
L7_1.SIG_CONTEXT = "NONFRIENDLYIMAGE"
L7_1.CONTENT_SOURCE = "BM"
L7_1.TAG = "INTERFLOW"
L7_1.ProcName = L1_1
L8_1 = mp
L8_1 = L8_1.CheckUrl
L9_1 = L0_1
L8_1, L9_1 = L8_1(L9_1)
if L8_1 == 1 and L9_1 == 1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = SafeGetUrlReputation
L11_1 = {}
L12_1 = L0_1
L11_1[1] = L12_1
L12_1 = L7_1
L13_1 = false
L14_1 = 2000
L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
L11_1 = L10_1.urls
L11_1 = L11_1[L0_1]
if L11_1 then
  L11_1 = L10_1.urls
  L11_1 = L11_1[L0_1]
  L11_1 = L11_1.determination
  if L11_1 == 2 then
    L11_1 = L10_1.urls
    L11_1 = L11_1[L0_1]
    L11_1 = L11_1.confidence
    if 60 <= L11_1 then
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      return L11_1
    end
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
