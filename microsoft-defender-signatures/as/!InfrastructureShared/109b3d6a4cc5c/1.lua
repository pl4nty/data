local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = GetRollingQueueKeys
L2_1 = "Medicated64Golang"
L1_1 = L1_1(L2_1)
L2_1 = GetRollingQueueKeys
L3_1 = "Medicated32Golang"
L2_1 = L2_1(L3_1)
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = isnull
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L4_1 = L4_1.utf8p2
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L0_1 = L3_1
  end
end
if (L1_1 or L2_1) and L0_1 then
  L3_1 = pcall
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L0_1
  L6_1 = "DestIp=([^;]+)"
  L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 then
    L5_1 = isnull
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      goto lbl_48
    end
  end
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  do return L5_1 end
  ::lbl_48::
  L5_1 = isPublicIP
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = {}
    L5_1.SIG_CONTEXT = "BM"
    L5_1.CONTENT_SOURCE = "SusGolang_A_SLIVER_C2"
    L6_1 = mp
    L6_1 = L6_1.CheckUrl
    L7_1 = L4_1
    L6_1, L7_1 = L6_1(L7_1)
    if L6_1 == 1 and L7_1 == 1 then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
    L8_1 = SafeGetUrlReputation
    L9_1 = {}
    L10_1 = L4_1
    L9_1[1] = L10_1
    L10_1 = L5_1
    L11_1 = false
    L12_1 = 3000
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    L9_1 = L8_1.urls
    L9_1 = L9_1[L4_1]
    if L9_1 then
      L9_1 = L8_1.urls
      L9_1 = L9_1[L4_1]
      L9_1 = L9_1.determination
      if L9_1 ~= 1 then
        L9_1 = L8_1.urls
        L9_1 = L9_1[L4_1]
        L9_1 = L9_1.confidence
        if L9_1 ~= 90 then
          L9_1 = bm
          L9_1 = L9_1.add_related_string
          L10_1 = "[i] MALICIOUS URL: "
          L11_1 = L4_1
          L12_1 = bm
          L12_1 = L12_1.RelatedStringBMReport
          L9_1(L10_1, L11_1, L12_1)
          L9_1 = add_parents
          L9_1()
          L9_1 = mp
          L9_1 = L9_1.INFECTED
          return L9_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
