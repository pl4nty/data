local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_26
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_26::
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L3_1 = L4_1.utf8p1
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[3]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L3_1 = L4_1.utf8p1
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L3_1 = L4_1.utf8p1
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[5]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[5]
        L3_1 = L4_1.utf8p1
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[6]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[6]
          L3_1 = L4_1.utf8p1
        else
          L4_1 = this_sigattrlog
          L4_1 = L4_1[7]
          L4_1 = L4_1.matched
          if L4_1 then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[7]
            L3_1 = L4_1.utf8p1
          else
            L4_1 = this_sigattrlog
            L4_1 = L4_1[8]
            L4_1 = L4_1.matched
            if L4_1 then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[8]
              L3_1 = L4_1.utf8p1
            else
              L4_1 = this_sigattrlog
              L4_1 = L4_1[9]
              L4_1 = L4_1.matched
              if L4_1 then
                L4_1 = this_sigattrlog
                L4_1 = L4_1[9]
                L3_1 = L4_1.utf8p1
              else
                L4_1 = this_sigattrlog
                L4_1 = L4_1[10]
                L4_1 = L4_1.matched
                if L4_1 then
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[10]
                  L3_1 = L4_1.utf8p1
                else
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[11]
                  L4_1 = L4_1.matched
                  if L4_1 then
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[11]
                    L3_1 = L4_1.utf8p1
                  else
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[12]
                    L4_1 = L4_1.matched
                    if L4_1 then
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[12]
                      L3_1 = L4_1.utf8p1
                    else
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[13]
                      L4_1 = L4_1.matched
                      if L4_1 then
                        L4_1 = this_sigattrlog
                        L4_1 = L4_1[13]
                        L3_1 = L4_1.utf8p1
                      else
                        L4_1 = this_sigattrlog
                        L4_1 = L4_1[14]
                        L4_1 = L4_1.matched
                        if L4_1 then
                          L4_1 = this_sigattrlog
                          L4_1 = L4_1[14]
                          L3_1 = L4_1.utf8p1
                        else
                          L4_1 = this_sigattrlog
                          L4_1 = L4_1[15]
                          L4_1 = L4_1.matched
                          if L4_1 then
                            L4_1 = this_sigattrlog
                            L4_1 = L4_1[15]
                            L3_1 = L4_1.utf8p1
                          else
                            L4_1 = this_sigattrlog
                            L4_1 = L4_1[16]
                            L4_1 = L4_1.matched
                            if L4_1 then
                              L4_1 = this_sigattrlog
                              L4_1 = L4_1[16]
                              L3_1 = L4_1.utf8p1
                            else
                              L4_1 = this_sigattrlog
                              L4_1 = L4_1[17]
                              L4_1 = L4_1.matched
                              if L4_1 then
                                L4_1 = this_sigattrlog
                                L4_1 = L4_1[17]
                                L3_1 = L4_1.utf8p1
                              else
                                L4_1 = this_sigattrlog
                                L4_1 = L4_1[18]
                                L4_1 = L4_1.matched
                                if L4_1 then
                                  L4_1 = this_sigattrlog
                                  L4_1 = L4_1[18]
                                  L3_1 = L4_1.utf8p1
                                else
                                  L4_1 = this_sigattrlog
                                  L4_1 = L4_1[19]
                                  L4_1 = L4_1.matched
                                  if L4_1 then
                                    L4_1 = this_sigattrlog
                                    L4_1 = L4_1[19]
                                    L3_1 = L4_1.utf8p1
                                  else
                                    L4_1 = this_sigattrlog
                                    L4_1 = L4_1[20]
                                    L4_1 = L4_1.matched
                                    if L4_1 then
                                      L4_1 = this_sigattrlog
                                      L4_1 = L4_1[20]
                                      L3_1 = L4_1.utf8p1
                                    else
                                      L4_1 = this_sigattrlog
                                      L4_1 = L4_1[21]
                                      L4_1 = L4_1.matched
                                      if L4_1 then
                                        L4_1 = this_sigattrlog
                                        L4_1 = L4_1[21]
                                        L3_1 = L4_1.utf8p1
                                      else
                                        L4_1 = mp
                                        L4_1 = L4_1.CLEAN
                                        return L4_1
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
L4_1 = bm
L4_1 = L4_1.trigger_sig
L5_1 = "BM_MacFileCreateInDPRKPaths"
L6_1 = L3_1
L4_1(L5_1, L6_1)
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
