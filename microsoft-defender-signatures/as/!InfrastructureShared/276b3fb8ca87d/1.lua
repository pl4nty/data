local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[7]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[7]
    L0_1 = L1_1.utf8p1
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
      L1_1 = this_sigattrlog
      L1_1 = L1_1[8]
      L0_1 = L1_1.utf8p1
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
        L1_1 = this_sigattrlog
        L1_1 = L1_1[9]
        L0_1 = L1_1.utf8p1
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
          L1_1 = this_sigattrlog
          L1_1 = L1_1[10]
          L0_1 = L1_1.utf8p1
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
            L1_1 = this_sigattrlog
            L1_1 = L1_1[11]
            L0_1 = L1_1.utf8p1
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[12]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[12]
            L1_1 = L1_1.utf8p1
            if L1_1 ~= nil then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[12]
              L0_1 = L1_1.utf8p1
          end
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[13]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[13]
              L1_1 = L1_1.utf8p1
              if L1_1 ~= nil then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[13]
                L0_1 = L1_1.utf8p1
              end
            end
          end
        end
      end
    end
  end
end
if L0_1 then
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1095"
  L4_1 = "CommandandControl_NonApplicationLayerProtocol"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = bm
  L1_1 = L1_1.trigger_sig
  L2_1 = "RawSocketOpen"
  L3_1 = L0_1
  L1_1(L2_1, L3_1)
  L1_1 = bm
  L1_1 = L1_1.add_related_file
  L2_1 = L0_1
  L1_1(L2_1)
  L1_1 = addRelatedProcess
  L1_1()
  L1_1 = reportRelatedBmHits
  L1_1()
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
