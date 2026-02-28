local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = isParentPackageManager
L3_1 = L1_1.ppid
L4_1 = true
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[16]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[16]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[16]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[17]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[17]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[17]
      L4_1 = L4_1.utf8p1
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
  end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[18]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[18]
      L3_1 = L3_1.utf8p1
      if L3_1 ~= nil then
        L3_1 = string
        L3_1 = L3_1.lower
        L4_1 = this_sigattrlog
        L4_1 = L4_1[18]
        L4_1 = L4_1.utf8p1
        L3_1 = L3_1(L4_1)
        L2_1 = L3_1
    end
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[19]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[19]
        L3_1 = L3_1.utf8p1
        if L3_1 ~= nil then
          L3_1 = string
          L3_1 = L3_1.lower
          L4_1 = this_sigattrlog
          L4_1 = L4_1[19]
          L4_1 = L4_1.utf8p1
          L3_1 = L3_1(L4_1)
          L2_1 = L3_1
      end
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[20]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[20]
          L3_1 = L3_1.utf8p1
          if L3_1 ~= nil then
            L3_1 = string
            L3_1 = L3_1.lower
            L4_1 = this_sigattrlog
            L4_1 = L4_1[20]
            L4_1 = L4_1.utf8p1
            L3_1 = L3_1(L4_1)
            L2_1 = L3_1
        end
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[21]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[21]
            L3_1 = L3_1.utf8p1
            if L3_1 ~= nil then
              L3_1 = string
              L3_1 = L3_1.lower
              L4_1 = this_sigattrlog
              L4_1 = L4_1[21]
              L4_1 = L4_1.utf8p1
              L3_1 = L3_1(L4_1)
              L2_1 = L3_1
          end
          else
            L3_1 = this_sigattrlog
            L3_1 = L3_1[22]
            L3_1 = L3_1.matched
            if L3_1 then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[22]
              L3_1 = L3_1.utf8p1
              if L3_1 ~= nil then
                L3_1 = string
                L3_1 = L3_1.lower
                L4_1 = this_sigattrlog
                L4_1 = L4_1[22]
                L4_1 = L4_1.utf8p1
                L3_1 = L3_1(L4_1)
                L2_1 = L3_1
            end
            else
              L3_1 = this_sigattrlog
              L3_1 = L3_1[23]
              L3_1 = L3_1.matched
              if L3_1 then
                L3_1 = this_sigattrlog
                L3_1 = L3_1[23]
                L3_1 = L3_1.utf8p1
                if L3_1 ~= nil then
                  L3_1 = string
                  L3_1 = L3_1.lower
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[23]
                  L4_1 = L4_1.utf8p1
                  L3_1 = L3_1(L4_1)
                  L2_1 = L3_1
              end
              else
                L3_1 = this_sigattrlog
                L3_1 = L3_1[24]
                L3_1 = L3_1.matched
                if L3_1 then
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[24]
                  L3_1 = L3_1.utf8p1
                  if L3_1 ~= nil then
                    L3_1 = string
                    L3_1 = L3_1.lower
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[24]
                    L4_1 = L4_1.utf8p1
                    L3_1 = L3_1(L4_1)
                    L2_1 = L3_1
                end
                else
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[25]
                  L3_1 = L3_1.matched
                  if L3_1 then
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[25]
                    L3_1 = L3_1.utf8p1
                    if L3_1 ~= nil then
                      L3_1 = string
                      L3_1 = L3_1.lower
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[25]
                      L4_1 = L4_1.utf8p1
                      L3_1 = L3_1(L4_1)
                      L2_1 = L3_1
                  end
                  else
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[26]
                    L3_1 = L3_1.matched
                    if L3_1 then
                      L3_1 = this_sigattrlog
                      L3_1 = L3_1[26]
                      L3_1 = L3_1.utf8p1
                      if L3_1 ~= nil then
                        L3_1 = string
                        L3_1 = L3_1.lower
                        L4_1 = this_sigattrlog
                        L4_1 = L4_1[26]
                        L4_1 = L4_1.utf8p1
                        L3_1 = L3_1(L4_1)
                        L2_1 = L3_1
                    end
                    else
                      L3_1 = this_sigattrlog
                      L3_1 = L3_1[27]
                      L3_1 = L3_1.matched
                      if L3_1 then
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[27]
                        L3_1 = L3_1.utf8p1
                        if L3_1 ~= nil then
                          L3_1 = string
                          L3_1 = L3_1.lower
                          L4_1 = this_sigattrlog
                          L4_1 = L4_1[27]
                          L4_1 = L4_1.utf8p1
                          L3_1 = L3_1(L4_1)
                          L2_1 = L3_1
                      end
                      else
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[28]
                        L3_1 = L3_1.matched
                        if L3_1 then
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[28]
                          L3_1 = L3_1.utf8p1
                          if L3_1 ~= nil then
                            L3_1 = string
                            L3_1 = L3_1.lower
                            L4_1 = this_sigattrlog
                            L4_1 = L4_1[28]
                            L4_1 = L4_1.utf8p1
                            L3_1 = L3_1(L4_1)
                            L2_1 = L3_1
                        end
                        else
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[29]
                          L3_1 = L3_1.matched
                          if L3_1 then
                            L3_1 = this_sigattrlog
                            L3_1 = L3_1[29]
                            L3_1 = L3_1.utf8p1
                            if L3_1 ~= nil then
                              L3_1 = string
                              L3_1 = L3_1.lower
                              L4_1 = this_sigattrlog
                              L4_1 = L4_1[29]
                              L4_1 = L4_1.utf8p1
                              L3_1 = L3_1(L4_1)
                              L2_1 = L3_1
                          end
                          else
                            L3_1 = this_sigattrlog
                            L3_1 = L3_1[30]
                            L3_1 = L3_1.matched
                            if L3_1 then
                              L3_1 = this_sigattrlog
                              L3_1 = L3_1[30]
                              L3_1 = L3_1.utf8p1
                              if L3_1 ~= nil then
                                L3_1 = string
                                L3_1 = L3_1.lower
                                L4_1 = this_sigattrlog
                                L4_1 = L4_1[30]
                                L4_1 = L4_1.utf8p1
                                L3_1 = L3_1(L4_1)
                                L2_1 = L3_1
                            end
                            else
                              L3_1 = this_sigattrlog
                              L3_1 = L3_1[31]
                              L3_1 = L3_1.matched
                              if L3_1 then
                                L3_1 = this_sigattrlog
                                L3_1 = L3_1[31]
                                L3_1 = L3_1.utf8p1
                                if L3_1 ~= nil then
                                  L3_1 = string
                                  L3_1 = L3_1.lower
                                  L4_1 = this_sigattrlog
                                  L4_1 = L4_1[31]
                                  L4_1 = L4_1.utf8p1
                                  L3_1 = L3_1(L4_1)
                                  L2_1 = L3_1
                              end
                              else
                                L3_1 = this_sigattrlog
                                L3_1 = L3_1[32]
                                L3_1 = L3_1.matched
                                if L3_1 then
                                  L3_1 = this_sigattrlog
                                  L3_1 = L3_1[32]
                                  L3_1 = L3_1.utf8p1
                                  if L3_1 ~= nil then
                                    L3_1 = string
                                    L3_1 = L3_1.lower
                                    L4_1 = this_sigattrlog
                                    L4_1 = L4_1[32]
                                    L4_1 = L4_1.utf8p1
                                    L3_1 = L3_1(L4_1)
                                    L2_1 = L3_1
                                end
                                else
                                  L3_1 = this_sigattrlog
                                  L3_1 = L3_1[33]
                                  L3_1 = L3_1.matched
                                  if L3_1 then
                                    L3_1 = this_sigattrlog
                                    L3_1 = L3_1[33]
                                    L3_1 = L3_1.utf8p1
                                    if L3_1 ~= nil then
                                      L3_1 = string
                                      L3_1 = L3_1.lower
                                      L4_1 = this_sigattrlog
                                      L4_1 = L4_1[33]
                                      L4_1 = L4_1.utf8p1
                                      L3_1 = L3_1(L4_1)
                                      L2_1 = L3_1
                                  end
                                  else
                                    L3_1 = this_sigattrlog
                                    L3_1 = L3_1[34]
                                    L3_1 = L3_1.matched
                                    if L3_1 then
                                      L3_1 = this_sigattrlog
                                      L3_1 = L3_1[34]
                                      L3_1 = L3_1.utf8p1
                                      if L3_1 ~= nil then
                                        L3_1 = string
                                        L3_1 = L3_1.lower
                                        L4_1 = this_sigattrlog
                                        L4_1 = L4_1[34]
                                        L4_1 = L4_1.utf8p1
                                        L3_1 = L3_1(L4_1)
                                        L2_1 = L3_1
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
            end
          end
        end
      end
    end
  end
end
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.trigger_sig
L4_1 = "BM_ExecWithMasqueradedExt"
L5_1 = L2_1
L3_1(L4_1, L5_1)
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1036.008"
L6_1 = "DefenseEvasion_Masquerading_FileType"
L3_1(L4_1, L5_1, L6_1)
L3_1 = taint
L4_1 = L2_1
L5_1 = "masqueraded_file_extension_taint"
L6_1 = 3600
L3_1(L4_1, L5_1, L6_1)
L3_1 = addRelatedProcess
L3_1()
L3_1 = reportRelatedBmHits
L3_1()
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
