local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = GetRollingQueueKeys
L1_1 = "Medicated64Golang"
L0_1 = L0_1(L1_1)
L1_1 = GetRollingQueueKeys
L2_1 = "Medicated32Golang"
L1_1 = L1_1(L2_1)
if L0_1 or L1_1 then
  L2_1 = nil
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = isnull
    L4_1 = this_sigattrlog
    L4_1 = L4_1[7]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[7]
      L2_1 = L3_1.utf8p2
  end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[8]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = isnull
      L4_1 = this_sigattrlog
      L4_1 = L4_1[8]
      L4_1 = L4_1.utf8p2
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[8]
        L2_1 = L3_1.utf8p2
    end
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[9]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = isnull
        L4_1 = this_sigattrlog
        L4_1 = L4_1[9]
        L4_1 = L4_1.utf8p2
        L3_1 = L3_1(L4_1)
        if not L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[9]
          L2_1 = L3_1.utf8p2
      end
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[10]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = isnull
          L4_1 = this_sigattrlog
          L4_1 = L4_1[10]
          L4_1 = L4_1.utf8p2
          L3_1 = L3_1(L4_1)
          if not L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[10]
            L2_1 = L3_1.utf8p2
        end
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[11]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = isnull
            L4_1 = this_sigattrlog
            L4_1 = L4_1[11]
            L4_1 = L4_1.utf8p2
            L3_1 = L3_1(L4_1)
            if not L3_1 then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[11]
              L2_1 = L3_1.utf8p2
          end
          else
            L3_1 = this_sigattrlog
            L3_1 = L3_1[12]
            L3_1 = L3_1.matched
            if L3_1 then
              L3_1 = isnull
              L4_1 = this_sigattrlog
              L4_1 = L4_1[12]
              L4_1 = L4_1.utf8p2
              L3_1 = L3_1(L4_1)
              if not L3_1 then
                L3_1 = this_sigattrlog
                L3_1 = L3_1[12]
                L2_1 = L3_1.utf8p2
              end
            end
          end
        end
      end
    end
  end
  if L2_1 then
    L3_1 = pcall
    L4_1 = string
    L4_1 = L4_1.match
    L5_1 = L2_1
    L6_1 = "Uri=([^;]+)"
    L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 then
      L5_1 = isnull
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if not L5_1 then
        goto lbl_125
      end
    end
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    do return L5_1 end
    ::lbl_125::
    L5_1 = isValidLocalDomain
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      L5_1 = {}
      L5_1.SIG_CONTEXT = "BM"
      L5_1.CONTENT_SOURCE = "SusGolang_B_SLIVER_C2"
      L6_1 = string
      L6_1 = L6_1.match
      L7_1 = L4_1
      L8_1 = "^https?://"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 then
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
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
