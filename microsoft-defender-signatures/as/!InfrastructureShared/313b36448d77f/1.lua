local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L3_1 = this_sigattrlog
L3_1 = L3_1[7]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = this_sigattrlog
  L4_1 = L4_1[7]
  L4_1 = L4_1.utf8p1
  L3_1 = L3_1(L4_1)
  L0_1 = L3_1
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[8]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[8]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[9]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[9]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[9]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
  end
end
if L2_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[2]
        L3_1 = L3_1.utf8p2
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[3]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[3]
            L3_1 = L3_1.utf8p2
            if L3_1 then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[4]
              L3_1 = L3_1.matched
              if L3_1 then
                L3_1 = this_sigattrlog
                L3_1 = L3_1[4]
                L3_1 = L3_1.utf8p2
              end
            end
          end
        end
      end
    end
  end
  if L3_1 then
    L4_1 = string
    L4_1 = L4_1.match
    L5_1 = L3_1
    L6_1 = "Uri=([^;]+)"
    L4_1 = L4_1(L5_1, L6_1)
    L5_1 = isnull
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = {}
    L5_1.SIG_CONTEXT = "BM"
    L5_1.CONTENT_SOURCE = "IRL_MAPVIEW_EDR"
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
        if L9_1 == 2 then
          L9_1 = L8_1.urls
          L9_1 = L9_1[L4_1]
          L9_1 = L9_1.confidence
          if 60 <= L9_1 then
            L9_1 = pcall
            L10_1 = string
            L10_1 = L10_1.match
            L11_1 = L2_1
            L12_1 = "vmbaseaddress:(%d+)"
            L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
            if L9_1 then
              L11_1 = isnull
              L12_1 = L10_1
              L11_1 = L11_1(L12_1)
              if not L11_1 then
                goto lbl_157
              end
            end
            L11_1 = mp
            L11_1 = L11_1.CLEAN
            do return L11_1 end
            ::lbl_157::
            L11_1 = pcall
            L12_1 = string
            L12_1 = L12_1.match
            L13_1 = L2_1
            L14_1 = "vmregionsize:(%d+)"
            L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1)
            if L11_1 then
              L13_1 = isnull
              L14_1 = L12_1
              L13_1 = L13_1(L14_1)
              if not L13_1 then
                goto lbl_173
              end
            end
            L13_1 = mp
            L13_1 = L13_1.CLEAN
            do return L13_1 end
            ::lbl_173::
            L13_1 = nil
            L14_1 = nil
            L15_1 = versioning
            L15_1 = L15_1.GetProcessorArchitecture
            L15_1 = L15_1()
            if L15_1 == 0 then
              L13_1 = L1_1
              L14_1 = "32"
            elseif L15_1 == 9 then
              L16_1 = this_sigattrlog
              L16_1 = L16_1[7]
              L16_1 = L16_1.matched
              if L16_1 then
                L13_1 = L0_1
                L14_1 = "32"
              else
                L16_1 = this_sigattrlog
                L16_1 = L16_1[8]
                L16_1 = L16_1.matched
                if L16_1 then
                  L13_1 = L1_1
                  L14_1 = "64"
                end
              end
            end
            if L13_1 then
              L16_1 = pcall
              L17_1 = sysio
              L17_1 = L17_1.GetPEVersionInfo
              L18_1 = L13_1
              L16_1, L17_1 = L16_1(L17_1, L18_1)
              if L16_1 then
                L18_1 = isnull
                L19_1 = L17_1
                L18_1 = L18_1(L19_1)
                if not L18_1 then
                  goto lbl_216
                end
              end
              L18_1 = mp
              L18_1 = L18_1.CLEAN
              do return L18_1 end
              ::lbl_216::
              L18_1 = L17_1.OriginalFilename
              L19_1 = L17_1.ProductVersion
              L20_1 = L17_1.FileVersion
              L21_1 = isnull
              L22_1 = L18_1
              L21_1 = L21_1(L22_1)
              if not L21_1 then
                L21_1 = isnull
                L22_1 = L19_1
                L21_1 = L21_1(L22_1)
                if not L21_1 then
                  L21_1 = isnull
                  L22_1 = L20_1
                  L21_1 = L21_1(L22_1)
                  if not L21_1 then
                    goto lbl_237
                  end
                end
              end
              L21_1 = mp
              L21_1 = L21_1.CLEAN
              do return L21_1 end
              ::lbl_237::
              L21_1 = {}
              L21_1.product_version = L19_1
              L21_1.file_version = L20_1
              L21_1.arch_str = L14_1
              L21_1.sizeof_shellcode = L12_1
              L21_1.address_of_shellcode = L10_1
              L21_1.dest_url = L4_1
              L22_1 = bm
              L22_1 = L22_1.set_detection_string
              L23_1 = safeJsonSerialize
              L24_1 = L21_1
              L23_1, L24_1, L25_1 = L23_1(L24_1)
              L22_1(L23_1, L24_1, L25_1)
              L22_1 = bm
              L22_1 = L22_1.add_related_string
              L23_1 = "PRODUCT VERSION: "
              L24_1 = L19_1
              L25_1 = bm
              L25_1 = L25_1.RelatedStringBMReport
              L22_1(L23_1, L24_1, L25_1)
              L22_1 = bm
              L22_1 = L22_1.add_related_string
              L23_1 = "FILE VERSION: "
              L24_1 = L20_1
              L25_1 = bm
              L25_1 = L25_1.RelatedStringBMReport
              L22_1(L23_1, L24_1, L25_1)
              L22_1 = bm
              L22_1 = L22_1.add_related_string
              L23_1 = "ARCH: "
              L24_1 = L14_1
              L25_1 = bm
              L25_1 = L25_1.RelatedStringBMReport
              L22_1(L23_1, L24_1, L25_1)
            end
            L16_1 = bm
            L16_1 = L16_1.add_related_string
            L17_1 = "SHELLCODE BYTES: "
            L18_1 = L12_1
            L19_1 = bm
            L19_1 = L19_1.RelatedStringBMReport
            L16_1(L17_1, L18_1, L19_1)
            L16_1 = bm
            L16_1 = L16_1.add_related_string
            L17_1 = "SHELLCODE ADDRESS: "
            L18_1 = L10_1
            L19_1 = bm
            L19_1 = L19_1.RelatedStringBMReport
            L16_1(L17_1, L18_1, L19_1)
            L16_1 = bm
            L16_1 = L16_1.add_related_string
            L17_1 = "MALICIOUS URL: "
            L18_1 = L4_1
            L19_1 = bm
            L19_1 = L19_1.RelatedStringBMReport
            L16_1(L17_1, L18_1, L19_1)
            L16_1 = mp
            L16_1 = L16_1.INFECTED
            return L16_1
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
