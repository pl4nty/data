local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L1_1 = L2_1.utf8p1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[6]
      L1_1 = L2_1.utf8p1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[7]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[7]
        L1_1 = L2_1.utf8p1
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[8]
        L2_1 = L2_1.utf8p1
        if L2_1 ~= nil then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[8]
          L1_1 = L2_1.utf8p1
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[9]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[9]
          L2_1 = L2_1.utf8p1
          if L2_1 ~= nil then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[9]
            L1_1 = L2_1.utf8p1
        end
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[10]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[10]
            L2_1 = L2_1.utf8p1
            if L2_1 ~= nil then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[10]
              L1_1 = L2_1.utf8p1
          end
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[11]
            L2_1 = L2_1.matched
            if L2_1 then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[11]
              L2_1 = L2_1.utf8p1
              if L2_1 ~= nil then
                L2_1 = this_sigattrlog
                L2_1 = L2_1[11]
                L1_1 = L2_1.utf8p1
              end
            end
          end
        end
      end
    end
  end
end
L2_1 = sysio
L2_1 = L2_1.ReadFile
L3_1 = L1_1
L4_1 = 1
L5_1 = 3
L2_1 = L2_1(L3_1, L4_1, L5_1)
L0_1 = L2_1
if L1_1 and L0_1 and L0_1 == "ELF" then
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = "BM"
  L4_1 = "T1021.004"
  L5_1 = "LateralMovement_SshConnectionInBruteDrop"
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = reportRelatedBmHits
  L2_1()
  L2_1 = bm
  L2_1 = L2_1.add_related_file
  L3_1 = L1_1
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
