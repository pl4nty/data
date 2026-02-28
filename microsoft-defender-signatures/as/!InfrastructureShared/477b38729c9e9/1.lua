local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
L1_1 = isParentPackageManager
L2_1 = L0_1.ppid
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L3_1 = L3_1.utf8p2
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[6]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[6]
        L2_1 = L2_1.utf8p2
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = this_sigattrlog
          L3_1 = L3_1[6]
          L3_1 = L3_1.utf8p2
          L2_1 = L2_1(L3_1)
          L1_1 = L2_1
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[7]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[7]
          L2_1 = L2_1.utf8p2
          if L2_1 ~= nil then
            L2_1 = string
            L2_1 = L2_1.lower
            L3_1 = this_sigattrlog
            L3_1 = L3_1[7]
            L3_1 = L3_1.utf8p2
            L2_1 = L2_1(L3_1)
            L1_1 = L2_1
        end
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[8]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[8]
            L2_1 = L2_1.utf8p2
            if L2_1 ~= nil then
              L2_1 = string
              L2_1 = L2_1.lower
              L3_1 = this_sigattrlog
              L3_1 = L3_1[8]
              L3_1 = L3_1.utf8p2
              L2_1 = L2_1(L3_1)
              L1_1 = L2_1
          end
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[9]
            L2_1 = L2_1.matched
            if L2_1 then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[9]
              L2_1 = L2_1.utf8p2
              if L2_1 ~= nil then
                L2_1 = string
                L2_1 = L2_1.lower
                L3_1 = this_sigattrlog
                L3_1 = L3_1[9]
                L3_1 = L3_1.utf8p2
                L2_1 = L2_1(L3_1)
                L1_1 = L2_1
            end
            else
              L2_1 = this_sigattrlog
              L2_1 = L2_1[10]
              L2_1 = L2_1.matched
              if L2_1 then
                L2_1 = this_sigattrlog
                L2_1 = L2_1[10]
                L2_1 = L2_1.utf8p2
                if L2_1 ~= nil then
                  L2_1 = string
                  L2_1 = L2_1.lower
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[10]
                  L3_1 = L3_1.utf8p2
                  L2_1 = L2_1(L3_1)
                  L1_1 = L2_1
              end
              else
                L2_1 = this_sigattrlog
                L2_1 = L2_1[11]
                L2_1 = L2_1.matched
                if L2_1 then
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[11]
                  L2_1 = L2_1.utf8p2
                  if L2_1 ~= nil then
                    L2_1 = string
                    L2_1 = L2_1.lower
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[11]
                    L3_1 = L3_1.utf8p2
                    L2_1 = L2_1(L3_1)
                    L1_1 = L2_1
                end
                else
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[12]
                  L2_1 = L2_1.matched
                  if L2_1 then
                    L2_1 = this_sigattrlog
                    L2_1 = L2_1[12]
                    L2_1 = L2_1.utf8p2
                    if L2_1 ~= nil then
                      L2_1 = string
                      L2_1 = L2_1.lower
                      L3_1 = this_sigattrlog
                      L3_1 = L3_1[12]
                      L3_1 = L3_1.utf8p2
                      L2_1 = L2_1(L3_1)
                      L1_1 = L2_1
                  end
                  else
                    L2_1 = this_sigattrlog
                    L2_1 = L2_1[13]
                    L2_1 = L2_1.matched
                    if L2_1 then
                      L2_1 = this_sigattrlog
                      L2_1 = L2_1[13]
                      L2_1 = L2_1.utf8p2
                      if L2_1 ~= nil then
                        L2_1 = string
                        L2_1 = L2_1.lower
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[13]
                        L3_1 = L3_1.utf8p2
                        L2_1 = L2_1(L3_1)
                        L1_1 = L2_1
                    end
                    else
                      L2_1 = this_sigattrlog
                      L2_1 = L2_1[14]
                      L2_1 = L2_1.matched
                      if L2_1 then
                        L2_1 = this_sigattrlog
                        L2_1 = L2_1[14]
                        L2_1 = L2_1.utf8p2
                        if L2_1 ~= nil then
                          L2_1 = string
                          L2_1 = L2_1.lower
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[14]
                          L3_1 = L3_1.utf8p2
                          L2_1 = L2_1(L3_1)
                          L1_1 = L2_1
                      end
                      else
                        L2_1 = this_sigattrlog
                        L2_1 = L2_1[15]
                        L2_1 = L2_1.matched
                        if L2_1 then
                          L2_1 = this_sigattrlog
                          L2_1 = L2_1[15]
                          L2_1 = L2_1.utf8p2
                          if L2_1 ~= nil then
                            L2_1 = string
                            L2_1 = L2_1.lower
                            L3_1 = this_sigattrlog
                            L3_1 = L3_1[15]
                            L3_1 = L3_1.utf8p2
                            L2_1 = L2_1(L3_1)
                            L1_1 = L2_1
                        end
                        else
                          L2_1 = this_sigattrlog
                          L2_1 = L2_1[16]
                          L2_1 = L2_1.matched
                          if L2_1 then
                            L2_1 = this_sigattrlog
                            L2_1 = L2_1[16]
                            L2_1 = L2_1.utf8p2
                            if L2_1 ~= nil then
                              L2_1 = string
                              L2_1 = L2_1.lower
                              L3_1 = this_sigattrlog
                              L3_1 = L3_1[16]
                              L3_1 = L3_1.utf8p2
                              L2_1 = L2_1(L3_1)
                              L1_1 = L2_1
                          end
                          else
                            L2_1 = this_sigattrlog
                            L2_1 = L2_1[17]
                            L2_1 = L2_1.matched
                            if L2_1 then
                              L2_1 = this_sigattrlog
                              L2_1 = L2_1[17]
                              L2_1 = L2_1.utf8p2
                              if L2_1 ~= nil then
                                L2_1 = string
                                L2_1 = L2_1.lower
                                L3_1 = this_sigattrlog
                                L3_1 = L3_1[17]
                                L3_1 = L3_1.utf8p2
                                L2_1 = L2_1(L3_1)
                                L1_1 = L2_1
                            end
                            else
                              L2_1 = this_sigattrlog
                              L2_1 = L2_1[18]
                              L2_1 = L2_1.matched
                              if L2_1 then
                                L2_1 = this_sigattrlog
                                L2_1 = L2_1[18]
                                L2_1 = L2_1.utf8p2
                                if L2_1 ~= nil then
                                  L2_1 = string
                                  L2_1 = L2_1.lower
                                  L3_1 = this_sigattrlog
                                  L3_1 = L3_1[18]
                                  L3_1 = L3_1.utf8p2
                                  L2_1 = L2_1(L3_1)
                                  L1_1 = L2_1
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
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 4) then
    goto lbl_317
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_317::
L2_1 = 3848698581
L3_1 = mp
L3_1 = L3_1.ReportLowfi
L4_1 = L1_1
L5_1 = L2_1
L3_1(L4_1, L5_1)
L3_1 = reportRelatedBmHits
L3_1()
L3_1 = addRelatedProcess
L3_1()
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
