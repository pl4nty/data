local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[5]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[6]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[6]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
  end
end
if L0_1 and L1_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[2]
        L2_1 = L2_1.utf8p2
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[3]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[3]
            L2_1 = L2_1.utf8p2
            if L2_1 then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[4]
              L2_1 = L2_1.matched
              if L2_1 then
                L2_1 = this_sigattrlog
                L2_1 = L2_1[4]
                L2_1 = L2_1.utf8p2
              end
            end
          end
        end
      end
    end
  end
  if L2_1 then
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L2_1
    L5_1 = "Uri=([^;]+)"
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = isnull
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = {}
    L4_1.SIG_CONTEXT = "BM"
    L4_1.CONTENT_SOURCE = "ALLOCVM_TAINT"
    L5_1 = string
    L5_1 = L5_1.match
    L6_1 = L3_1
    L7_1 = "^https?://"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CheckUrl
      L6_1 = L3_1
      L5_1, L6_1 = L5_1(L6_1)
      if L5_1 == 1 and L6_1 == 1 then
        L7_1 = mp
        L7_1 = L7_1.CLEAN
        return L7_1
      end
      L7_1 = SafeGetUrlReputation
      L8_1 = {}
      L9_1 = L3_1
      L8_1[1] = L9_1
      L9_1 = L4_1
      L10_1 = false
      L11_1 = 3000
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      L8_1 = L7_1.urls
      L8_1 = L8_1[L3_1]
      if L8_1 then
        L8_1 = L7_1.urls
        L8_1 = L8_1[L3_1]
        L8_1 = L8_1.determination
        if L8_1 == 2 then
          L8_1 = L7_1.urls
          L8_1 = L8_1[L3_1]
          L8_1 = L8_1.confidence
          if 60 <= L8_1 then
            L8_1 = pcall
            L9_1 = string
            L9_1 = L9_1.match
            L10_1 = L0_1
            L11_1 = "regionsize:(%d+)"
            L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1)
            if L8_1 then
              L10_1 = isnull
              L11_1 = L9_1
              L10_1 = L10_1(L11_1)
              if not L10_1 then
                goto lbl_151
              end
            end
            L10_1 = mp
            L10_1 = L10_1.CLEAN
            do return L10_1 end
            ::lbl_151::
            L10_1 = bm
            L10_1 = L10_1.add_related_string
            L11_1 = "SHELLCODE BYTES: "
            L12_1 = L9_1
            L13_1 = bm
            L13_1 = L13_1.RelatedStringBMReport
            L10_1(L11_1, L12_1, L13_1)
            L10_1 = bm
            L10_1 = L10_1.add_related_string
            L11_1 = "MALCIOUS PATH: "
            L12_1 = L1_1
            L13_1 = bm
            L13_1 = L13_1.RelatedStringBMReport
            L10_1(L11_1, L12_1, L13_1)
            L10_1 = bm
            L10_1 = L10_1.add_related_string
            L11_1 = "MALICIOUS URL: "
            L12_1 = L3_1
            L13_1 = bm
            L13_1 = L13_1.RelatedStringBMReport
            L10_1(L11_1, L12_1, L13_1)
            L10_1 = mp
            L10_1 = L10_1.INFECTED
            return L10_1
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
