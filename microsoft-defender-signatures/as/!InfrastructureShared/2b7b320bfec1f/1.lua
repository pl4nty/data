local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[6]
  L1_1 = L1_1.utf8p1
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
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[2]
        L1_1 = L1_1.utf8p2
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[3]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[3]
            L1_1 = L1_1.utf8p2
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[4]
              L1_1 = L1_1.matched
              if L1_1 then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[4]
                L1_1 = L1_1.utf8p2
              end
            end
          end
        end
      end
    end
  end
  if L1_1 then
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L1_1
    L4_1 = "Uri=([^;]+)"
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = isnull
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = {}
    L3_1.SIG_CONTEXT = "BM"
    L3_1.CONTENT_SOURCE = "ALLOCVM_REMOTETHREAD"
    L4_1 = string
    L4_1 = L4_1.match
    L5_1 = L2_1
    L6_1 = "^https?://"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CheckUrl
      L5_1 = L2_1
      L4_1, L5_1 = L4_1(L5_1)
      if L4_1 == 1 and L5_1 == 1 then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = SafeGetUrlReputation
      L7_1 = {}
      L8_1 = L2_1
      L7_1[1] = L8_1
      L8_1 = L3_1
      L9_1 = false
      L10_1 = 3000
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      L7_1 = L6_1.urls
      L7_1 = L7_1[L2_1]
      if L7_1 then
        L7_1 = L6_1.urls
        L7_1 = L7_1[L2_1]
        L7_1 = L7_1.determination
        if L7_1 == 2 then
          L7_1 = L6_1.urls
          L7_1 = L7_1[L2_1]
          L7_1 = L7_1.confidence
          if 60 <= L7_1 then
            L7_1 = pcall
            L8_1 = string
            L8_1 = L8_1.match
            L9_1 = L0_1
            L10_1 = "vmbaseaddress:(%d+)"
            L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1)
            if L7_1 then
              L9_1 = isnull
              L10_1 = L8_1
              L9_1 = L9_1(L10_1)
              if not L9_1 then
                goto lbl_132
              end
            end
            L9_1 = mp
            L9_1 = L9_1.CLEAN
            do return L9_1 end
            ::lbl_132::
            L9_1 = pcall
            L10_1 = string
            L10_1 = L10_1.match
            L11_1 = L0_1
            L12_1 = "vmbytescopied:(%d+)"
            L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
            if L9_1 then
              L11_1 = isnull
              L12_1 = L10_1
              L11_1 = L11_1(L12_1)
              if not L11_1 then
                goto lbl_148
              end
            end
            L11_1 = mp
            L11_1 = L11_1.CLEAN
            do return L11_1 end
            ::lbl_148::
            L11_1 = bm
            L11_1 = L11_1.add_related_string
            L12_1 = "SHELLCODE BYTES: "
            L13_1 = L10_1
            L14_1 = bm
            L14_1 = L14_1.RelatedStringBMReport
            L11_1(L12_1, L13_1, L14_1)
            L11_1 = bm
            L11_1 = L11_1.add_related_string
            L12_1 = "SHELLCODE ADDRESS: "
            L13_1 = L8_1
            L14_1 = bm
            L14_1 = L14_1.RelatedStringBMReport
            L11_1(L12_1, L13_1, L14_1)
            L11_1 = bm
            L11_1 = L11_1.add_related_string
            L12_1 = "MALICIOUS URL: "
            L13_1 = L2_1
            L14_1 = bm
            L14_1 = L14_1.RelatedStringBMReport
            L11_1(L12_1, L13_1, L14_1)
            L11_1 = mp
            L11_1 = L11_1.INFECTED
            return L11_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
