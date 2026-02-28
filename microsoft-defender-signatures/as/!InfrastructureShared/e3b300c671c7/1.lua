local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
if L0_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and L0_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = ""
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L1_1 = L2_1.utf8p1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.utf8p1
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L1_1 = L2_1.utf8p1
    end
  end
end
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "imagepath:"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L1_1
    L4_1 = "imagepath:(%w.*)"
    L2_1 = L2_1(L3_1, L4_1)
    L1_1 = L2_1
    L2_1 = isnull
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.match
      L4_1 = "^(.+)\\"
      L2_1 = L2_1(L3_1, L4_1)
      L3_1 = L2_1
      L4_1 = "\\attack.yml"
      L3_1 = L3_1 .. L4_1
      L4_1 = sysio
      L4_1 = L4_1.IsFileExists
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      if L4_1 then
        L4_1 = sysio
        L4_1 = L4_1.GetFileSize
        L5_1 = L3_1
        L4_1 = L4_1(L5_1)
        if 1000 < L4_1 and L4_1 < 30000 then
          L5_1 = sysio
          L5_1 = L5_1.ReadFile
          L6_1 = L3_1
          L7_1 = 0
          L8_1 = L4_1
          L5_1 = L5_1(L6_1, L7_1, L8_1)
          if L5_1 then
            L6_1 = false
            L7_1 = {}
            L8_1 = {}
            L8_1.n = "c2NlbmFyaW9fbmFtZTooLi0pCg=="
            L8_1.i = "c2NlbmFyaW9faWQ6KC4tKQo="
            L9_1 = pairs
            L10_1 = L8_1
            L9_1, L10_1, L11_1 = L9_1(L10_1)
            for L12_1, L13_1 in L9_1, L10_1, L11_1 do
              L14_1 = MpCommon
              L14_1 = L14_1.Base64Decode
              L15_1 = L13_1
              L14_1 = L14_1(L15_1)
              L13_1 = L14_1
              L14_1 = string
              L14_1 = L14_1.match
              L15_1 = L5_1
              L16_1 = L13_1
              L14_1 = L14_1(L15_1, L16_1)
              if L14_1 then
                L16_1 = L14_1
                L15_1 = L14_1.lower
                L15_1 = L15_1(L16_1)
                L14_1 = L15_1
                L16_1 = L14_1
                L15_1 = L14_1.gsub
                L17_1 = "^%s+"
                L18_1 = ""
                L15_1 = L15_1(L16_1, L17_1, L18_1)
                L16_1 = L15_1
                L15_1 = L15_1.gsub
                L17_1 = "%s+$"
                L18_1 = ""
                L15_1 = L15_1(L16_1, L17_1, L18_1)
                L14_1 = L15_1
                L7_1[L12_1] = L14_1
                L15_1 = L12_1
                L16_1 = "scrubbed"
                L15_1 = L15_1 .. L16_1
                L16_1 = scrubData
                L17_1 = L14_1
                L16_1 = L16_1(L17_1)
                L7_1[L15_1] = L16_1
                L6_1 = true
              end
            end
            if L6_1 == true then
              L9_1 = MpCommon
              L9_1 = L9_1.Base64Encode
              L10_1 = safeJsonSerialize
              L11_1 = L7_1
              L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L10_1(L11_1)
              L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
              L10_1 = reportTimingData
              L10_1()
              L10_1 = bm
              L10_1 = L10_1.add_related_string
              L11_1 = "epaiq"
              L12_1 = L9_1
              L13_1 = bm
              L13_1 = L13_1.RelatedStringBMReport
              L10_1(L11_1, L12_1, L13_1)
              L10_1 = bm
              L10_1 = L10_1.add_related_file
              L11_1 = L3_1
              L10_1(L11_1)
              L10_1 = mp
              L10_1 = L10_1.INFECTED
              return L10_1
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
