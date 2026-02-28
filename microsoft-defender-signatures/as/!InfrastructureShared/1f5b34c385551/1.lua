local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = nil
L3_1 = {}
L4_1 = {}
L5_1 = "/usr/bin/make"
L6_1 = ""
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = {}
L6_1 = "/usr/bin/ninja"
L7_1 = ""
L5_1[1] = L6_1
L5_1[2] = L7_1
L3_1[1] = L4_1
L3_1[2] = L5_1
L4_1 = L1_1.ppid
if L4_1 ~= nil and L0_1 ~= nil then
  L4_1 = isParentPackageManager
  L5_1 = L1_1.ppid
  L6_1 = true
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = checkParentCmdline
    L5_1 = L1_1.ppid
    L6_1 = L3_1
    L7_1 = 3
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if not L4_1 then
      goto lbl_39
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_39::
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L2_1 = L4_1.utf8p1
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p1
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L2_1 = L4_1.utf8p1
  end
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L4_1 = L4_1.utf8p1
      if L4_1 ~= nil then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[3]
        L2_1 = L4_1.utf8p1
    end
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[4]
        L4_1 = L4_1.utf8p1
        if L4_1 ~= nil then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[4]
          L2_1 = L4_1.utf8p1
      end
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[5]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[5]
          L4_1 = L4_1.utf8p1
          if L4_1 ~= nil then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[5]
            L2_1 = L4_1.utf8p1
        end
        else
          L4_1 = this_sigattrlog
          L4_1 = L4_1[6]
          L4_1 = L4_1.matched
          if L4_1 then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[6]
            L4_1 = L4_1.utf8p1
            if L4_1 ~= nil then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[6]
              L2_1 = L4_1.utf8p1
          end
          else
            L4_1 = this_sigattrlog
            L4_1 = L4_1[7]
            L4_1 = L4_1.matched
            if L4_1 then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[7]
              L4_1 = L4_1.utf8p1
              if L4_1 ~= nil then
                L4_1 = this_sigattrlog
                L4_1 = L4_1[7]
                L2_1 = L4_1.utf8p1
            end
            else
              L4_1 = this_sigattrlog
              L4_1 = L4_1[8]
              L4_1 = L4_1.matched
              if L4_1 then
                L4_1 = this_sigattrlog
                L4_1 = L4_1[8]
                L4_1 = L4_1.utf8p1
                if L4_1 ~= nil then
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[8]
                  L2_1 = L4_1.utf8p1
              end
              else
                L4_1 = this_sigattrlog
                L4_1 = L4_1[9]
                L4_1 = L4_1.matched
                if L4_1 then
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[9]
                  L4_1 = L4_1.utf8p1
                  if L4_1 ~= nil then
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[9]
                    L2_1 = L4_1.utf8p1
                end
                else
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[10]
                  L4_1 = L4_1.matched
                  if L4_1 then
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[10]
                    L4_1 = L4_1.utf8p1
                    if L4_1 ~= nil then
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[10]
                      L2_1 = L4_1.utf8p1
                  end
                  else
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[11]
                    L4_1 = L4_1.matched
                    if L4_1 then
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[11]
                      L4_1 = L4_1.utf8p1
                      if L4_1 ~= nil then
                        L4_1 = this_sigattrlog
                        L4_1 = L4_1[11]
                        L2_1 = L4_1.utf8p1
                    end
                    else
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[12]
                      L4_1 = L4_1.matched
                      if L4_1 then
                        L4_1 = this_sigattrlog
                        L4_1 = L4_1[12]
                        L4_1 = L4_1.utf8p1
                        if L4_1 ~= nil then
                          L4_1 = this_sigattrlog
                          L4_1 = L4_1[12]
                          L2_1 = L4_1.utf8p1
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
if L2_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = isTainted
L5_1 = L0_1
L6_1 = "remote_file_created_taint"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = addRelatedProcess
  L4_1()
  L4_1 = reportRelatedBmHits
  L4_1()
  L4_1 = bm
  L4_1 = L4_1.add_related_file
  L5_1 = L2_1
  L4_1(L5_1)
  L4_1 = TrackPidAndTechniqueBM
  L5_1 = "BM"
  L6_1 = "T1036"
  L7_1 = "DefenseEvasion_Masquerading_FileDropinBinByRemoteFile"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
