local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L1_1 = {}
  L2_1 = ".pdf"
  L3_1 = ".rtf"
  L4_1 = ".docx"
  L5_1 = ".doc"
  L6_1 = ".xls"
  L7_1 = ".xlsx"
  L8_1 = ".ppt"
  L9_1 = ".pptx"
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L1_1[3] = L4_1
  L1_1[4] = L5_1
  L1_1[5] = L6_1
  L1_1[6] = L7_1
  L1_1[7] = L8_1
  L1_1[8] = L9_1
  L2_1 = 0
  L3_1 = this_sigattrlog
  L3_1 = L3_1[10]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[10]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[11]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[11]
        L3_1 = L3_1.utf8p1
        if L3_1 ~= nil then
          L3_1 = false
          L4_1 = this_sigattrlog
          L4_1 = L4_1[10]
          L4_1 = L4_1.utf8p1
          L5_1 = this_sigattrlog
          L5_1 = L5_1[11]
          L5_1 = L5_1.utf8p1
          L6_1 = ipairs
          L7_1 = L1_1
          L6_1, L7_1, L8_1 = L6_1(L7_1)
          for L9_1, L10_1 in L6_1, L7_1, L8_1 do
            L12_1 = L4_1
            L11_1 = L4_1.sub
            L13_1 = #L10_1
            L13_1 = -1 * L13_1
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 == L10_1 then
              L11_1 = L10_1
              L12_1 = "."
              L11_1 = L11_1 .. L12_1
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L5_1
              L14_1 = L11_1
              L15_1 = 1
              L16_1 = true
              L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
              if L12_1 then
                L3_1 = true
                L2_1 = L2_1 + 1
              end
            end
          end
          if L3_1 == false then
            L6_1 = mp
            L6_1 = L6_1.CLEAN
            return L6_1
          end
        end
      end
    end
  end
  L3_1 = this_sigattrlog
  L3_1 = L3_1[12]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[12]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[13]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[13]
        L3_1 = L3_1.utf8p1
        if L3_1 ~= nil then
          L3_1 = false
          L4_1 = this_sigattrlog
          L4_1 = L4_1[12]
          L4_1 = L4_1.utf8p1
          L5_1 = this_sigattrlog
          L5_1 = L5_1[13]
          L5_1 = L5_1.utf8p1
          L6_1 = ipairs
          L7_1 = L1_1
          L6_1, L7_1, L8_1 = L6_1(L7_1)
          for L9_1, L10_1 in L6_1, L7_1, L8_1 do
            L12_1 = L4_1
            L11_1 = L4_1.sub
            L13_1 = #L10_1
            L13_1 = -1 * L13_1
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 == L10_1 then
              L11_1 = L10_1
              L12_1 = "."
              L11_1 = L11_1 .. L12_1
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L5_1
              L14_1 = L11_1
              L15_1 = 1
              L16_1 = true
              L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
              if L12_1 then
                L3_1 = true
                L2_1 = L2_1 + 1
              end
            end
          end
          if L3_1 == false then
            L6_1 = mp
            L6_1 = L6_1.CLEAN
            return L6_1
          end
        end
      end
    end
  end
  L3_1 = this_sigattrlog
  L3_1 = L3_1[14]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[14]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[15]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[15]
        L3_1 = L3_1.utf8p1
        if L3_1 ~= nil then
          L3_1 = false
          L4_1 = this_sigattrlog
          L4_1 = L4_1[14]
          L4_1 = L4_1.utf8p1
          L5_1 = this_sigattrlog
          L5_1 = L5_1[15]
          L5_1 = L5_1.utf8p1
          L6_1 = ipairs
          L7_1 = L1_1
          L6_1, L7_1, L8_1 = L6_1(L7_1)
          for L9_1, L10_1 in L6_1, L7_1, L8_1 do
            L12_1 = L4_1
            L11_1 = L4_1.sub
            L13_1 = #L10_1
            L13_1 = -1 * L13_1
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 == L10_1 then
              L11_1 = L10_1
              L12_1 = "."
              L11_1 = L11_1 .. L12_1
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L5_1
              L14_1 = L11_1
              L15_1 = 1
              L16_1 = true
              L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
              if L12_1 then
                L3_1 = true
                L2_1 = L2_1 + 1
              end
            end
          end
          if L3_1 == false then
            L6_1 = mp
            L6_1 = L6_1.CLEAN
            return L6_1
          end
        end
      end
    end
  end
  L3_1 = this_sigattrlog
  L3_1 = L3_1[16]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[16]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[17]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[17]
        L3_1 = L3_1.utf8p1
        if L3_1 ~= nil then
          L3_1 = false
          L4_1 = this_sigattrlog
          L4_1 = L4_1[16]
          L4_1 = L4_1.utf8p1
          L5_1 = this_sigattrlog
          L5_1 = L5_1[17]
          L5_1 = L5_1.utf8p1
          L6_1 = ipairs
          L7_1 = L1_1
          L6_1, L7_1, L8_1 = L6_1(L7_1)
          for L9_1, L10_1 in L6_1, L7_1, L8_1 do
            L12_1 = L4_1
            L11_1 = L4_1.sub
            L13_1 = #L10_1
            L13_1 = -1 * L13_1
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 == L10_1 then
              L11_1 = L10_1
              L12_1 = "."
              L11_1 = L11_1 .. L12_1
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L5_1
              L14_1 = L11_1
              L15_1 = 1
              L16_1 = true
              L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
              if L12_1 then
                L3_1 = true
                L2_1 = L2_1 + 1
              end
            end
          end
          if L3_1 == false then
            L6_1 = mp
            L6_1 = L6_1.CLEAN
            return L6_1
          end
        end
      end
    end
  end
  L3_1 = this_sigattrlog
  L3_1 = L3_1[18]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[18]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[19]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[19]
        L3_1 = L3_1.utf8p1
        if L3_1 ~= nil then
          L3_1 = false
          L4_1 = this_sigattrlog
          L4_1 = L4_1[18]
          L4_1 = L4_1.utf8p1
          L5_1 = this_sigattrlog
          L5_1 = L5_1[19]
          L5_1 = L5_1.utf8p1
          L6_1 = ipairs
          L7_1 = L1_1
          L6_1, L7_1, L8_1 = L6_1(L7_1)
          for L9_1, L10_1 in L6_1, L7_1, L8_1 do
            L12_1 = L4_1
            L11_1 = L4_1.sub
            L13_1 = #L10_1
            L13_1 = -1 * L13_1
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 == L10_1 then
              L11_1 = L10_1
              L12_1 = "."
              L11_1 = L11_1 .. L12_1
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L5_1
              L14_1 = L11_1
              L15_1 = 1
              L16_1 = true
              L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
              if L12_1 then
                L3_1 = true
                L2_1 = L2_1 + 1
              end
            end
          end
          if L3_1 == false then
            L6_1 = mp
            L6_1 = L6_1.CLEAN
            return L6_1
          end
        end
      end
    end
  end
  if L2_1 == 5 then
    L3_1 = addRelatedProcess
    L3_1()
    L3_1 = reportRelatedBmHits
    L3_1()
    L3_1 = bm
    L3_1 = L3_1.add_related_string
    L4_1 = "ImagePath"
    L5_1 = L0_1
    L6_1 = bm
    L6_1 = L6_1.RelatedStringBMReport
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = TrackPidAndTechniqueBM
    L4_1 = "BM"
    L5_1 = "T1486"
    L6_1 = "Impact_FileEncryption"
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
