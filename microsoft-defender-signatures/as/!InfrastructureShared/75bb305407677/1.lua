local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = L1_1.command_line
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
L4_1 = IsExcludedByCmdlineMacOS
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = IsExcludedByImagePathMacOS
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_21
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_21::
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    if L4_1 ~= "" then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = this_sigattrlog
      L5_1 = L5_1[4]
      L5_1 = L5_1.utf8p2
      L4_1 = L4_1(L5_1)
      L0_1 = L4_1
  end
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[5]
      if L4_1 ~= "" then
        L4_1 = string
        L4_1 = L4_1.lower
        L5_1 = this_sigattrlog
        L5_1 = L5_1[5]
        L5_1 = L5_1.utf8p2
        L4_1 = L4_1(L5_1)
        L0_1 = L4_1
    end
  end
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[6]
      if L4_1 ~= nil then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[6]
        if L4_1 ~= "" then
          L4_1 = string
          L4_1 = L4_1.lower
          L5_1 = this_sigattrlog
          L5_1 = L5_1[6]
          L5_1 = L5_1.utf8p2
          L4_1 = L4_1(L5_1)
          L0_1 = L4_1
      end
    end
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[7]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[7]
        if L4_1 ~= nil then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[7]
          if L4_1 ~= "" then
            L4_1 = string
            L4_1 = L4_1.lower
            L5_1 = this_sigattrlog
            L5_1 = L5_1[7]
            L5_1 = L5_1.utf8p2
            L4_1 = L4_1(L5_1)
            L0_1 = L4_1
        end
      end
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[8]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[8]
          if L4_1 ~= nil then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[8]
            if L4_1 ~= "" then
              L4_1 = string
              L4_1 = L4_1.lower
              L5_1 = this_sigattrlog
              L5_1 = L5_1[8]
              L5_1 = L5_1.utf8p2
              L4_1 = L4_1(L5_1)
              L0_1 = L4_1
          end
        end
        else
          L4_1 = this_sigattrlog
          L4_1 = L4_1[9]
          L4_1 = L4_1.matched
          if L4_1 then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[9]
            if L4_1 ~= nil then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[9]
              if L4_1 ~= "" then
                L4_1 = string
                L4_1 = L4_1.lower
                L5_1 = this_sigattrlog
                L5_1 = L5_1[9]
                L5_1 = L5_1.utf8p2
                L4_1 = L4_1(L5_1)
                L0_1 = L4_1
            end
          end
          else
            L4_1 = this_sigattrlog
            L4_1 = L4_1[10]
            L4_1 = L4_1.matched
            if L4_1 then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[10]
              if L4_1 ~= nil then
                L4_1 = this_sigattrlog
                L4_1 = L4_1[10]
                if L4_1 ~= "" then
                  L4_1 = string
                  L4_1 = L4_1.lower
                  L5_1 = this_sigattrlog
                  L5_1 = L5_1[10]
                  L5_1 = L5_1.utf8p2
                  L4_1 = L4_1(L5_1)
                  L0_1 = L4_1
              end
            end
            else
              L4_1 = this_sigattrlog
              L4_1 = L4_1[11]
              L4_1 = L4_1.matched
              if L4_1 then
                L4_1 = this_sigattrlog
                L4_1 = L4_1[11]
                if L4_1 ~= nil then
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[11]
                  if L4_1 ~= "" then
                    L4_1 = string
                    L4_1 = L4_1.lower
                    L5_1 = this_sigattrlog
                    L5_1 = L5_1[11]
                    L5_1 = L5_1.utf8p2
                    L4_1 = L4_1(L5_1)
                    L0_1 = L4_1
                end
              end
              else
                L4_1 = this_sigattrlog
                L4_1 = L4_1[12]
                L4_1 = L4_1.matched
                if L4_1 then
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[12]
                  if L4_1 ~= nil then
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[12]
                    if L4_1 ~= "" then
                      L4_1 = string
                      L4_1 = L4_1.lower
                      L5_1 = this_sigattrlog
                      L5_1 = L5_1[12]
                      L5_1 = L5_1.utf8p2
                      L4_1 = L4_1(L5_1)
                      L0_1 = L4_1
                  end
                end
                else
                  L4_1 = this_sigattrlog
                  L4_1 = L4_1[13]
                  L4_1 = L4_1.matched
                  if L4_1 then
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[13]
                    if L4_1 ~= nil then
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[13]
                      if L4_1 ~= "" then
                        L4_1 = string
                        L4_1 = L4_1.lower
                        L5_1 = this_sigattrlog
                        L5_1 = L5_1[13]
                        L5_1 = L5_1.utf8p2
                        L4_1 = L4_1(L5_1)
                        L0_1 = L4_1
                    end
                  end
                  else
                    L4_1 = this_sigattrlog
                    L4_1 = L4_1[14]
                    L4_1 = L4_1.matched
                    if L4_1 then
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[14]
                      if L4_1 ~= nil then
                        L4_1 = this_sigattrlog
                        L4_1 = L4_1[14]
                        if L4_1 ~= "" then
                          L4_1 = string
                          L4_1 = L4_1.lower
                          L5_1 = this_sigattrlog
                          L5_1 = L5_1[14]
                          L5_1 = L5_1.utf8p2
                          L4_1 = L4_1(L5_1)
                          L0_1 = L4_1
                      end
                    end
                    else
                      L4_1 = this_sigattrlog
                      L4_1 = L4_1[15]
                      L4_1 = L4_1.matched
                      if L4_1 then
                        L4_1 = this_sigattrlog
                        L4_1 = L4_1[15]
                        if L4_1 ~= nil then
                          L4_1 = this_sigattrlog
                          L4_1 = L4_1[15]
                          if L4_1 ~= "" then
                            L4_1 = string
                            L4_1 = L4_1.lower
                            L5_1 = this_sigattrlog
                            L5_1 = L5_1[15]
                            L5_1 = L5_1.utf8p2
                            L4_1 = L4_1(L5_1)
                            L0_1 = L4_1
                        end
                      end
                      else
                        L4_1 = this_sigattrlog
                        L4_1 = L4_1[16]
                        L4_1 = L4_1.matched
                        if L4_1 then
                          L4_1 = this_sigattrlog
                          L4_1 = L4_1[16]
                          if L4_1 ~= nil then
                            L4_1 = this_sigattrlog
                            L4_1 = L4_1[16]
                            if L4_1 ~= "" then
                              L4_1 = string
                              L4_1 = L4_1.lower
                              L5_1 = this_sigattrlog
                              L5_1 = L5_1[16]
                              L5_1 = L5_1.utf8p2
                              L4_1 = L4_1(L5_1)
                              L0_1 = L4_1
                          end
                        end
                        else
                          L4_1 = this_sigattrlog
                          L4_1 = L4_1[17]
                          L4_1 = L4_1.matched
                          if L4_1 then
                            L4_1 = this_sigattrlog
                            L4_1 = L4_1[17]
                            if L4_1 ~= nil then
                              L4_1 = this_sigattrlog
                              L4_1 = L4_1[17]
                              if L4_1 ~= "" then
                                L4_1 = string
                                L4_1 = L4_1.lower
                                L5_1 = this_sigattrlog
                                L5_1 = L5_1[17]
                                L5_1 = L5_1.utf8p2
                                L4_1 = L4_1(L5_1)
                                L0_1 = L4_1
                            end
                          end
                          else
                            L4_1 = this_sigattrlog
                            L4_1 = L4_1[18]
                            L4_1 = L4_1.matched
                            if L4_1 then
                              L4_1 = this_sigattrlog
                              L4_1 = L4_1[18]
                              if L4_1 ~= nil then
                                L4_1 = this_sigattrlog
                                L4_1 = L4_1[18]
                                if L4_1 ~= "" then
                                  L4_1 = string
                                  L4_1 = L4_1.lower
                                  L5_1 = this_sigattrlog
                                  L5_1 = L5_1[18]
                                  L5_1 = L5_1.utf8p2
                                  L4_1 = L4_1(L5_1)
                                  L0_1 = L4_1
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
if L0_1 == nil or L0_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "/system/library/launch"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/library/launchagents"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L0_1
    L6_1 = "/library/launchdaemons"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L0_1
      L6_1 = "/library/preferences"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        goto lbl_390
      end
    end
  end
  L4_1 = TrackPidAndTechniqueBM
  L5_1 = "BM"
  L6_1 = "T1647"
  L7_1 = "DefenseEvasion_PlistbuddyPlistFileModification"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "BM_PlistModUsingPlistbuddy"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_390::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
