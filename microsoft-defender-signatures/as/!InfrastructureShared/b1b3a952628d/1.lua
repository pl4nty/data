local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = 100000000
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if L0_1 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.wp2
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.wp2
    if L3_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L4_1 = L4_1.utf8p2
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
  end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.wp2
      if L3_1 ~= nil then
        L3_1 = string
        L3_1 = L3_1.lower
        L4_1 = this_sigattrlog
        L4_1 = L4_1[3]
        L4_1 = L4_1.utf8p2
        L3_1 = L3_1(L4_1)
        L2_1 = L3_1
    end
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.wp2
        if L3_1 ~= nil then
          L3_1 = string
          L3_1 = L3_1.lower
          L4_1 = this_sigattrlog
          L4_1 = L4_1[4]
          L4_1 = L4_1.utf8p2
          L3_1 = L3_1(L4_1)
          L2_1 = L3_1
      end
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[5]
          L3_1 = L3_1.wp2
          if L3_1 ~= nil then
            L3_1 = string
            L3_1 = L3_1.lower
            L4_1 = this_sigattrlog
            L4_1 = L4_1[5]
            L4_1 = L4_1.utf8p2
            L3_1 = L3_1(L4_1)
            L2_1 = L3_1
        end
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[6]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[6]
            L3_1 = L3_1.wp2
            if L3_1 ~= nil then
              L3_1 = string
              L3_1 = L3_1.lower
              L4_1 = this_sigattrlog
              L4_1 = L4_1[6]
              L4_1 = L4_1.utf8p2
              L3_1 = L3_1(L4_1)
              L2_1 = L3_1
            end
          end
        end
      end
    end
  end
end
if L2_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "copy-as-is"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "/usr/share/rear"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
    end
  end
  L3_1 = #L2_1
  if 2000 <= L3_1 then
    L3_1 = TrackPidAndTechniqueBM
    L4_1 = "BM"
    L5_1 = "T1560"
    L6_1 = "Collection_ArchiveData"
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = bm
    L3_1 = L3_1.add_related_string
    L4_1 = "archive_cmd"
    L5_1 = L2_1
    L6_1 = bm
    L6_1 = L6_1.RelatedStringBMReport
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = reportRelatedBmHits
    L3_1()
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
