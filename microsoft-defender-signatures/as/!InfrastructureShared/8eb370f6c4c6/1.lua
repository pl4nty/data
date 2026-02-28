local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p1
    if L0_1 then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[2]
      L0_1 = L0_1.utf8p2
      if L0_1 then
        L0_1 = safeJsonDeserialize
        L1_1 = this_sigattrlog
        L1_1 = L1_1[2]
        L1_1 = L1_1.utf8p2
        L0_1 = L0_1(L1_1)
        L1_1 = string
        L1_1 = L1_1.match
        L2_1 = bm
        L2_1 = L2_1.get_imagepath
        L2_1 = L2_1()
        L3_1 = L2_1
        L2_1 = L2_1.lower
        L2_1 = L2_1(L3_1)
        L3_1 = "appdata\\local\\(.*)"
        L1_1 = L1_1(L2_1, L3_1)
        L2_1 = this_sigattrlog
        L2_1 = L2_1[1]
        L2_1 = L2_1.utf8p1
        L3_1 = L2_1
        L2_1 = L2_1.lower
        L2_1 = L2_1(L3_1)
        L3_1 = string
        L3_1 = L3_1.byte
        L4_1 = L2_1
        L3_1 = L3_1(L4_1)
        L4_1 = string
        L4_1 = L4_1.byte
        L5_1 = "%"
        L4_1 = L4_1(L5_1)
        if L3_1 == L4_1 then
          L3_1 = string
          L3_1 = L3_1.match
          L4_1 = L2_1
          L5_1 = "%%localappdata%%\\(.*)"
          L3_1 = L3_1(L4_1, L5_1)
          L2_1 = L3_1
        else
          L3_1 = string
          L3_1 = L3_1.match
          L4_1 = L2_1
          L5_1 = "appdata\\local\\(.*)"
          L3_1 = L3_1(L4_1, L5_1)
          L2_1 = L3_1
        end
        if L1_1 == L2_1 then
          L3_1 = tonumber
          L4_1 = L0_1.append_size
          L3_1 = L3_1(L4_1)
          if L3_1 == 334 then
            L3_1 = reportTimingData
            L3_1()
            L3_1 = bm
            L3_1 = L3_1.add_related_string
            L4_1 = "file_append_meta"
            L5_1 = this_sigattrlog
            L5_1 = L5_1[2]
            L5_1 = L5_1.utf8p2
            L6_1 = bm
            L6_1 = L6_1.RelatedStringBMReport
            L3_1(L4_1, L5_1, L6_1)
            L3_1 = mp
            L3_1 = L3_1.INFECTED
            return L3_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
