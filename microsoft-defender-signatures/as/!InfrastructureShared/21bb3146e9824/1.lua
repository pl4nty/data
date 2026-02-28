local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = addRelatedProcess
L0_1()
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.utf8p1
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
  end
  else
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
        L2_1 = L2_1.utf8p1
        L1_1 = L1_1(L2_1)
        L0_1 = L1_1
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[7]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[7]
        L1_1 = L1_1.utf8p1
        if L1_1 ~= nil then
          L1_1 = string
          L1_1 = L1_1.lower
          L2_1 = this_sigattrlog
          L2_1 = L2_1[7]
          L2_1 = L2_1.utf8p1
          L1_1 = L1_1(L2_1)
          L0_1 = L1_1
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[8]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[8]
          L1_1 = L1_1.utf8p1
          if L1_1 ~= nil then
            L1_1 = string
            L1_1 = L1_1.lower
            L2_1 = this_sigattrlog
            L2_1 = L2_1[8]
            L2_1 = L2_1.utf8p1
            L1_1 = L1_1(L2_1)
            L0_1 = L1_1
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[9]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[9]
            L1_1 = L1_1.utf8p1
            if L1_1 ~= nil then
              L1_1 = string
              L1_1 = L1_1.lower
              L2_1 = this_sigattrlog
              L2_1 = L2_1[9]
              L2_1 = L2_1.utf8p1
              L1_1 = L1_1(L2_1)
              L0_1 = L1_1
          end
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[10]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[10]
              L1_1 = L1_1.utf8p1
              if L1_1 ~= nil then
                L1_1 = string
                L1_1 = L1_1.lower
                L2_1 = this_sigattrlog
                L2_1 = L2_1[10]
                L2_1 = L2_1.utf8p1
                L1_1 = L1_1(L2_1)
                L0_1 = L1_1
            end
            else
              L1_1 = this_sigattrlog
              L1_1 = L1_1[11]
              L1_1 = L1_1.matched
              if L1_1 then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[11]
                L1_1 = L1_1.utf8p1
                if L1_1 ~= nil then
                  L1_1 = string
                  L1_1 = L1_1.lower
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[11]
                  L2_1 = L2_1.utf8p1
                  L1_1 = L1_1(L2_1)
                  L0_1 = L1_1
                end
              end
            end
          end
        end
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 2) then
    goto lbl_157
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_157::
L1_1 = bm
L1_1 = L1_1.add_related_string
L2_1 = "file_metadata"
L3_1 = L0_1
L4_1 = bm
L4_1 = L4_1.RelatedStringBMReport
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
