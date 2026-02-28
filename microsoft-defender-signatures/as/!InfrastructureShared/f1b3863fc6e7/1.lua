local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = false
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    goto lbl_40
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    goto lbl_40
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    goto lbl_40
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
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
L4_1 = "core.microsoft"
L5_1 = "adobedtm.com"
L6_1 = "npmjs.org"
L7_1 = "mce-sys.com"
L8_1 = "adobess.com"
L9_1 = "anthropic.com"
L10_1 = "cloud.microsoft"
L11_1 = "npmmirror.com"
L12_1 = "preyproject.com"
L13_1 = "adobelogin.com"
L14_1 = "adobe.com"
L15_1 = "adobe.io"
L16_1 = "adobesc.com"
L17_1 = "playwright.dev"
L18_1 = "githubcopilot.com"
L19_1 = "nuget.org"
L20_1 = "http://192.168."
L21_1 = "http://10."
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L3_1[11] = L14_1
L3_1[12] = L15_1
L3_1[13] = L16_1
L3_1[14] = L17_1
L3_1[15] = L18_1
L3_1[16] = L19_1
L3_1[17] = L20_1
L3_1[18] = L21_1
L4_1 = contains
L5_1 = L2_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.utf8p2
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[1]
    L4_1 = L5_1.utf8p2
  end
end
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L6_1 = L4_1
L5_1 = L4_1.lower
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "node%.exe\"?%s+\"?([^\"]+%.js)\"?"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L6_1 = bm
  L6_1 = L6_1.add_related_file
  L7_1 = L5_1
  L6_1(L7_1)
end
L6_1 = {}
L6_1.SIG_CONTEXT = "NODE_JS"
L6_1.CONTENT_SOURCE = "BM"
L6_1.TAG = "INTERFLOW"
if not L0_1 then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L2_1
  L9_1 = "%."
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = mp
  L7_1 = L7_1.CheckUrl
  L8_1 = L2_1
  L7_1, L8_1 = L7_1(L8_1)
  if L7_1 == 1 and L8_1 == 1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
end
L7_1 = SafeGetUrlReputation
L8_1 = {}
L9_1 = L2_1
L8_1[1] = L9_1
L9_1 = L6_1
L10_1 = false
L11_1 = 2000
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
L8_1 = L7_1.urls
L8_1 = L8_1[L2_1]
if L8_1 then
  L8_1 = L7_1.urls
  L8_1 = L8_1[L2_1]
  L8_1 = L8_1.determination
  if L8_1 == 2 then
    L8_1 = L7_1.urls
    L8_1 = L8_1[L2_1]
    L8_1 = L8_1.confidence
    if 60 <= L8_1 then
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
