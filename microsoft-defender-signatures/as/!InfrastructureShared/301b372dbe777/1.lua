local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[13]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[13]
  L1_1 = L1_1.wp2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[13]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[14]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[14]
    L1_1 = L1_1.wp2
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[14]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[15]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[15]
      L1_1 = L1_1.wp2
      if L1_1 ~= nil then
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = this_sigattrlog
        L2_1 = L2_1[15]
        L2_1 = L2_1.utf8p2
        L1_1 = L1_1(L2_1)
        L0_1 = L1_1
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[16]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[16]
        L1_1 = L1_1.wp2
        if L1_1 ~= nil then
          L1_1 = string
          L1_1 = L1_1.lower
          L2_1 = this_sigattrlog
          L2_1 = L2_1[16]
          L2_1 = L2_1.utf8p2
          L1_1 = L1_1(L2_1)
          L0_1 = L1_1
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[17]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[17]
          L1_1 = L1_1.wp2
          if L1_1 ~= nil then
            L1_1 = string
            L1_1 = L1_1.lower
            L2_1 = this_sigattrlog
            L2_1 = L2_1[17]
            L2_1 = L2_1.utf8p2
            L1_1 = L1_1(L2_1)
            L0_1 = L1_1
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[18]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[18]
            L1_1 = L1_1.wp2
            if L1_1 ~= nil then
              L1_1 = string
              L1_1 = L1_1.lower
              L2_1 = this_sigattrlog
              L2_1 = L2_1[18]
              L2_1 = L2_1.utf8p2
              L1_1 = L1_1(L2_1)
              L0_1 = L1_1
          end
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[19]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[19]
              L1_1 = L1_1.wp2
              if L1_1 ~= nil then
                L1_1 = string
                L1_1 = L1_1.lower
                L2_1 = this_sigattrlog
                L2_1 = L2_1[19]
                L2_1 = L2_1.utf8p2
                L1_1 = L1_1(L2_1)
                L0_1 = L1_1
            end
            else
              L1_1 = this_sigattrlog
              L1_1 = L1_1[20]
              L1_1 = L1_1.matched
              if L1_1 then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[20]
                L1_1 = L1_1.wp2
                if L1_1 ~= nil then
                  L1_1 = string
                  L1_1 = L1_1.lower
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[20]
                  L2_1 = L2_1.utf8p2
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
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    goto lbl_155
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_155::
L2_1 = isParentPackageManager
L3_1 = L1_1.ppid
L4_1 = true
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[14]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "copy-as-is"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L0_1
      L4_1 = "/usr/share/rear"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
    end
  end
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = "BM"
  L4_1 = "T1048"
  L5_1 = "Exfiltration_Archive"
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = addRelatedProcess
  L2_1()
  L2_1 = reportRelatedBmHits
  L2_1()
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
