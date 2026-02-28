local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = L1_1.ppid
    if L2_1 ~= "" then
      L2_1 = L1_1.command_line
      if L2_1 ~= nil then
        goto lbl_18
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_18::
L2_1 = L1_1.command_line
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "/etc/xdg/chk"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "/etc/xdg/systemd/001"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "/opt/microsoft/mdatp/conf/scripts"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      goto lbl_49
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_49::
L3_1 = this_sigattrlog
L3_1 = L3_1[25]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[25]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[25]
    L3_1 = L3_1.utf8p2
    L4_1 = L3_1
    L3_1 = L3_1.lower
    L3_1 = L3_1(L4_1)
    L0_1 = L3_1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[26]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[26]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[26]
      L3_1 = L3_1.utf8p2
      L4_1 = L3_1
      L3_1 = L3_1.lower
      L3_1 = L3_1(L4_1)
      L0_1 = L3_1
  end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[27]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[27]
      L3_1 = L3_1.utf8p2
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[27]
        L3_1 = L3_1.utf8p2
        L4_1 = L3_1
        L3_1 = L3_1.lower
        L3_1 = L3_1(L4_1)
        L0_1 = L3_1
    end
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[28]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[28]
        L3_1 = L3_1.utf8p2
        if L3_1 ~= nil then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[28]
          L3_1 = L3_1.utf8p2
          L4_1 = L3_1
          L3_1 = L3_1.lower
          L3_1 = L3_1(L4_1)
          L0_1 = L3_1
      end
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[29]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[29]
          L3_1 = L3_1.utf8p2
          if L3_1 ~= nil then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[29]
            L3_1 = L3_1.utf8p2
            L4_1 = L3_1
            L3_1 = L3_1.lower
            L3_1 = L3_1(L4_1)
            L0_1 = L3_1
        end
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[30]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[30]
            L3_1 = L3_1.utf8p2
            if L3_1 ~= nil then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[30]
              L3_1 = L3_1.utf8p2
              L4_1 = L3_1
              L3_1 = L3_1.lower
              L3_1 = L3_1(L4_1)
              L0_1 = L3_1
          end
          else
            L3_1 = this_sigattrlog
            L3_1 = L3_1[31]
            L3_1 = L3_1.matched
            if L3_1 then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[31]
              L3_1 = L3_1.utf8p2
              if L3_1 ~= nil then
                L3_1 = this_sigattrlog
                L3_1 = L3_1[31]
                L3_1 = L3_1.utf8p2
                L4_1 = L3_1
                L3_1 = L3_1.lower
                L3_1 = L3_1(L4_1)
                L0_1 = L3_1
            end
            else
              L3_1 = this_sigattrlog
              L3_1 = L3_1[32]
              L3_1 = L3_1.matched
              if L3_1 then
                L3_1 = this_sigattrlog
                L3_1 = L3_1[32]
                L3_1 = L3_1.utf8p2
                if L3_1 ~= nil then
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[32]
                  L3_1 = L3_1.utf8p2
                  L4_1 = L3_1
                  L3_1 = L3_1.lower
                  L3_1 = L3_1(L4_1)
                  L0_1 = L3_1
              end
              else
                L3_1 = this_sigattrlog
                L3_1 = L3_1[33]
                L3_1 = L3_1.matched
                if L3_1 then
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[33]
                  L3_1 = L3_1.utf8p2
                  if L3_1 ~= nil then
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[33]
                    L3_1 = L3_1.utf8p2
                    L4_1 = L3_1
                    L3_1 = L3_1.lower
                    L3_1 = L3_1(L4_1)
                    L0_1 = L3_1
                end
                else
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[34]
                  L3_1 = L3_1.matched
                  if L3_1 then
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[34]
                    L3_1 = L3_1.utf8p2
                    if L3_1 ~= nil then
                      L3_1 = this_sigattrlog
                      L3_1 = L3_1[34]
                      L3_1 = L3_1.utf8p2
                      L4_1 = L3_1
                      L3_1 = L3_1.lower
                      L3_1 = L3_1(L4_1)
                      L0_1 = L3_1
                  end
                  else
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[35]
                    L3_1 = L3_1.matched
                    if L3_1 then
                      L3_1 = this_sigattrlog
                      L3_1 = L3_1[35]
                      L3_1 = L3_1.utf8p2
                      if L3_1 ~= nil then
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[35]
                        L3_1 = L3_1.utf8p2
                        L4_1 = L3_1
                        L3_1 = L3_1.lower
                        L3_1 = L3_1(L4_1)
                        L0_1 = L3_1
                    end
                    else
                      L3_1 = this_sigattrlog
                      L3_1 = L3_1[44]
                      L3_1 = L3_1.matched
                      if L3_1 then
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[44]
                        L3_1 = L3_1.utf8p2
                        if L3_1 ~= nil then
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[44]
                          L3_1 = L3_1.utf8p2
                          L4_1 = L3_1
                          L3_1 = L3_1.lower
                          L3_1 = L3_1(L4_1)
                          L0_1 = L3_1
                      end
                      else
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[45]
                        L3_1 = L3_1.matched
                        if L3_1 then
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[45]
                          L3_1 = L3_1.utf8p2
                          if L3_1 ~= nil then
                            L3_1 = this_sigattrlog
                            L3_1 = L3_1[45]
                            L3_1 = L3_1.utf8p2
                            L4_1 = L3_1
                            L3_1 = L3_1.lower
                            L3_1 = L3_1(L4_1)
                            L0_1 = L3_1
                        end
                        else
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[46]
                          L3_1 = L3_1.matched
                          if L3_1 then
                            L3_1 = this_sigattrlog
                            L3_1 = L3_1[46]
                            L3_1 = L3_1.utf8p2
                            if L3_1 ~= nil then
                              L3_1 = this_sigattrlog
                              L3_1 = L3_1[46]
                              L3_1 = L3_1.utf8p2
                              L4_1 = L3_1
                              L3_1 = L3_1.lower
                              L3_1 = L3_1(L4_1)
                              L0_1 = L3_1
                          end
                          else
                            L3_1 = this_sigattrlog
                            L3_1 = L3_1[47]
                            L3_1 = L3_1.matched
                            if L3_1 then
                              L3_1 = this_sigattrlog
                              L3_1 = L3_1[47]
                              L3_1 = L3_1.utf8p2
                              if L3_1 ~= nil then
                                L3_1 = this_sigattrlog
                                L3_1 = L3_1[47]
                                L3_1 = L3_1.utf8p2
                                L4_1 = L3_1
                                L3_1 = L3_1.lower
                                L3_1 = L3_1(L4_1)
                                L0_1 = L3_1
                            end
                            else
                              L3_1 = this_sigattrlog
                              L3_1 = L3_1[48]
                              L3_1 = L3_1.matched
                              if L3_1 then
                                L3_1 = this_sigattrlog
                                L3_1 = L3_1[48]
                                L3_1 = L3_1.utf8p2
                                if L3_1 ~= nil then
                                  L3_1 = this_sigattrlog
                                  L3_1 = L3_1[48]
                                  L3_1 = L3_1.utf8p2
                                  L4_1 = L3_1
                                  L3_1 = L3_1.lower
                                  L3_1 = L3_1(L4_1)
                                  L0_1 = L3_1
                              end
                              else
                                L3_1 = this_sigattrlog
                                L3_1 = L3_1[49]
                                L3_1 = L3_1.matched
                                if L3_1 then
                                  L3_1 = this_sigattrlog
                                  L3_1 = L3_1[49]
                                  L3_1 = L3_1.utf8p2
                                  if L3_1 ~= nil then
                                    L3_1 = this_sigattrlog
                                    L3_1 = L3_1[49]
                                    L3_1 = L3_1.utf8p2
                                    L4_1 = L3_1
                                    L3_1 = L3_1.lower
                                    L3_1 = L3_1(L4_1)
                                    L0_1 = L3_1
                                end
                                else
                                  L3_1 = this_sigattrlog
                                  L3_1 = L3_1[50]
                                  L3_1 = L3_1.matched
                                  if L3_1 then
                                    L3_1 = this_sigattrlog
                                    L3_1 = L3_1[50]
                                    L3_1 = L3_1.utf8p2
                                    if L3_1 ~= nil then
                                      L3_1 = this_sigattrlog
                                      L3_1 = L3_1[50]
                                      L3_1 = L3_1.utf8p2
                                      L4_1 = L3_1
                                      L3_1 = L3_1.lower
                                      L3_1 = L3_1(L4_1)
                                      L0_1 = L3_1
                                  end
                                  else
                                    L3_1 = this_sigattrlog
                                    L3_1 = L3_1[51]
                                    L3_1 = L3_1.matched
                                    if L3_1 then
                                      L3_1 = this_sigattrlog
                                      L3_1 = L3_1[51]
                                      L3_1 = L3_1.utf8p2
                                      if L3_1 ~= nil then
                                        L3_1 = this_sigattrlog
                                        L3_1 = L3_1[51]
                                        L3_1 = L3_1.utf8p2
                                        L4_1 = L3_1
                                        L3_1 = L3_1.lower
                                        L3_1 = L3_1(L4_1)
                                        L0_1 = L3_1
                                    end
                                    else
                                      L3_1 = this_sigattrlog
                                      L3_1 = L3_1[36]
                                      L3_1 = L3_1.matched
                                      if L3_1 then
                                        L3_1 = this_sigattrlog
                                        L3_1 = L3_1[36]
                                        L3_1 = L3_1.utf8p2
                                        if L3_1 ~= nil then
                                          L3_1 = this_sigattrlog
                                          L3_1 = L3_1[36]
                                          L3_1 = L3_1.utf8p2
                                          L4_1 = L3_1
                                          L3_1 = L3_1.lower
                                          L3_1 = L3_1(L4_1)
                                          L0_1 = L3_1
                                      end
                                      else
                                        L3_1 = this_sigattrlog
                                        L3_1 = L3_1[37]
                                        L3_1 = L3_1.matched
                                        if L3_1 then
                                          L3_1 = this_sigattrlog
                                          L3_1 = L3_1[37]
                                          L3_1 = L3_1.utf8p2
                                          if L3_1 ~= nil then
                                            L3_1 = this_sigattrlog
                                            L3_1 = L3_1[37]
                                            L3_1 = L3_1.utf8p2
                                            L4_1 = L3_1
                                            L3_1 = L3_1.lower
                                            L3_1 = L3_1(L4_1)
                                            L0_1 = L3_1
                                        end
                                        else
                                          L3_1 = this_sigattrlog
                                          L3_1 = L3_1[38]
                                          L3_1 = L3_1.matched
                                          if L3_1 then
                                            L3_1 = this_sigattrlog
                                            L3_1 = L3_1[38]
                                            L3_1 = L3_1.utf8p2
                                            if L3_1 ~= nil then
                                              L3_1 = this_sigattrlog
                                              L3_1 = L3_1[38]
                                              L3_1 = L3_1.utf8p2
                                              L4_1 = L3_1
                                              L3_1 = L3_1.lower
                                              L3_1 = L3_1(L4_1)
                                              L0_1 = L3_1
                                          end
                                          else
                                            L3_1 = this_sigattrlog
                                            L3_1 = L3_1[39]
                                            L3_1 = L3_1.matched
                                            if L3_1 then
                                              L3_1 = this_sigattrlog
                                              L3_1 = L3_1[39]
                                              L3_1 = L3_1.utf8p2
                                              if L3_1 ~= nil then
                                                L3_1 = this_sigattrlog
                                                L3_1 = L3_1[39]
                                                L3_1 = L3_1.utf8p2
                                                L4_1 = L3_1
                                                L3_1 = L3_1.lower
                                                L3_1 = L3_1(L4_1)
                                                L0_1 = L3_1
                                            end
                                            else
                                              L3_1 = this_sigattrlog
                                              L3_1 = L3_1[40]
                                              L3_1 = L3_1.matched
                                              if L3_1 then
                                                L3_1 = this_sigattrlog
                                                L3_1 = L3_1[40]
                                                L3_1 = L3_1.utf8p2
                                                if L3_1 ~= nil then
                                                  L3_1 = this_sigattrlog
                                                  L3_1 = L3_1[40]
                                                  L3_1 = L3_1.utf8p2
                                                  L4_1 = L3_1
                                                  L3_1 = L3_1.lower
                                                  L3_1 = L3_1(L4_1)
                                                  L0_1 = L3_1
                                              end
                                              else
                                                L3_1 = this_sigattrlog
                                                L3_1 = L3_1[41]
                                                L3_1 = L3_1.matched
                                                if L3_1 then
                                                  L3_1 = this_sigattrlog
                                                  L3_1 = L3_1[41]
                                                  L3_1 = L3_1.utf8p2
                                                  if L3_1 ~= nil then
                                                    L3_1 = this_sigattrlog
                                                    L3_1 = L3_1[41]
                                                    L3_1 = L3_1.utf8p2
                                                    L4_1 = L3_1
                                                    L3_1 = L3_1.lower
                                                    L3_1 = L3_1(L4_1)
                                                    L0_1 = L3_1
                                                end
                                                else
                                                  L3_1 = this_sigattrlog
                                                  L3_1 = L3_1[42]
                                                  L3_1 = L3_1.matched
                                                  if L3_1 then
                                                    L3_1 = this_sigattrlog
                                                    L3_1 = L3_1[42]
                                                    L3_1 = L3_1.utf8p2
                                                    if L3_1 ~= nil then
                                                      L3_1 = this_sigattrlog
                                                      L3_1 = L3_1[42]
                                                      L3_1 = L3_1.utf8p2
                                                      L4_1 = L3_1
                                                      L3_1 = L3_1.lower
                                                      L3_1 = L3_1(L4_1)
                                                      L0_1 = L3_1
                                                  end
                                                  else
                                                    L3_1 = this_sigattrlog
                                                    L3_1 = L3_1[43]
                                                    L3_1 = L3_1.matched
                                                    if L3_1 then
                                                      L3_1 = this_sigattrlog
                                                      L3_1 = L3_1[43]
                                                      L3_1 = L3_1.utf8p2
                                                      if L3_1 ~= nil then
                                                        L3_1 = this_sigattrlog
                                                        L3_1 = L3_1[43]
                                                        L3_1 = L3_1.utf8p2
                                                        L4_1 = L3_1
                                                        L3_1 = L3_1.lower
                                                        L3_1 = L3_1(L4_1)
                                                        L0_1 = L3_1
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
              end
            end
          end
        end
      end
    end
  end
end
if L0_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 0
L4_1 = {}
L5_1 = "mdatp"
L6_1 = "firewall"
L7_1 = "littlesnitch"
L8_1 = "opensnitch"
L9_1 = "avast"
L10_1 = "avira"
L11_1 = "mcafee"
L12_1 = "webprotection"
L13_1 = "isecespd"
L14_1 = "macmnsvc"
L15_1 = "masvc"
L16_1 = "avscan"
L17_1 = "rtvscand"
L18_1 = "symcfgd"
L19_1 = "scmdaemon"
L20_1 = "symantec"
L21_1 = "osquery"
L22_1 = "sophos"
L23_1 = "elastic-endpoint"
L24_1 = "falcon"
L25_1 = "nessusd"
L26_1 = "cbagentd"
L27_1 = "td-agent"
L28_1 = "packetbeat"
L29_1 = "filebeat"
L30_1 = "auditbeat"
L31_1 = "CynetEPS"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L4_1[11] = L15_1
L4_1[12] = L16_1
L4_1[13] = L17_1
L4_1[14] = L18_1
L4_1[15] = L19_1
L4_1[16] = L20_1
L4_1[17] = L21_1
L4_1[18] = L22_1
L4_1[19] = L23_1
L4_1[20] = L24_1
L4_1[21] = L25_1
L4_1[22] = L26_1
L4_1[23] = L27_1
L4_1[24] = L28_1
L4_1[25] = L29_1
L4_1[26] = L30_1
L4_1[27] = L31_1
L5_1 = string
L5_1 = L5_1.find
L6_1 = L0_1
L7_1 = "grep -e"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 == nil then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = "grep --color=auto -e"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 == nil then
    goto lbl_601
  end
end
L5_1 = pairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L0_1
  L12_1 = L9_1
  L13_1 = 1
  L14_1 = true
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 ~= nil then
    L3_1 = L3_1 + 1
  end
end
if 2 < L3_1 then
  L5_1 = TrackPidAndTechniqueBM
  L6_1 = "BM"
  L7_1 = "T1518.001"
  L8_1 = "SecuritySoftwareDiscovery_mt2023"
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = bm
  L5_1 = L5_1.get_process_relationships
  L5_1, L6_1 = L5_1()
  L7_1 = ipairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = bm
    L12_1 = L12_1.trigger_sig
    L13_1 = "BmTraverseTreeBlock"
    L14_1 = "Detected"
    L15_1 = L11_1.ppid
    L12_1(L13_1, L14_1, L15_1)
  end
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
::lbl_601::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
