local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L2_1 = L3_1.utf8p2
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L2_1 = L3_1.utf8p2
  end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[5]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[5]
      L3_1 = L3_1.utf8p2
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L2_1 = L3_1.utf8p2
    end
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[6]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[6]
        L3_1 = L3_1.utf8p2
        if L3_1 ~= nil then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[6]
          L2_1 = L3_1.utf8p2
      end
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[7]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[7]
          L3_1 = L3_1.utf8p2
          if L3_1 ~= nil then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[7]
            L2_1 = L3_1.utf8p2
        end
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[8]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[8]
            L3_1 = L3_1.utf8p2
            if L3_1 ~= nil then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[8]
              L2_1 = L3_1.utf8p2
            end
          end
        end
      end
    end
  end
end
if L2_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[9]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[9]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[9]
      L3_1 = L3_1.utf8p2
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[9]
        L0_1 = L3_1.utf8p1
        L3_1 = this_sigattrlog
        L3_1 = L3_1[9]
        L1_1 = L3_1.utf8p2
      end
    end
  end
  if L0_1 and L1_1 then
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L0_1
    L5_1 = "/.+/"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L2_1
      L6_1 = L3_1
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 then
        L4_1 = isTainted
        L5_1 = L1_1
        L6_1 = "remote_file_created_taint"
        L4_1 = L4_1(L5_1, L6_1)
        if L4_1 then
          L4_1 = taint
          L5_1 = L0_1
          L6_1 = "remote_file_created_taint"
          L7_1 = 3600
          L4_1(L5_1, L6_1, L7_1)
          L4_1 = TrackPidAndTechniqueBM
          L5_1 = "BM"
          L6_1 = "T1105"
          L7_1 = "CommandandControl_IngressToolTransfer_mt2023"
          L4_1(L5_1, L6_1, L7_1)
          L4_1 = mp
          L4_1 = L4_1.INFECTED
          return L4_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
