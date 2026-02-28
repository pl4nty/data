local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = L0_1
L0_1 = L0_1.lower
L0_1 = L0_1(L1_1)
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "conhost.exe"
L5_1 = "WerFault.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = false
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L1_1 = L3_1.utf8p2
  L3_1 = MpCommon
  L3_1 = L3_1.StringRegExpSearch
  L4_1 = "exec\\s+(puma|thin|rails|mongrel) "
  L5_1 = L1_1
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L2_1 = true
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L1_1 = L3_1.utf8p2
    L2_1 = true
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L1_1 = L3_1.utf8p2
      L2_1 = true
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[5]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L1_1 = L3_1.utf8p2
        L2_1 = true
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[6]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[6]
          L1_1 = L3_1.utf8p2
          L2_1 = true
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[7]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[7]
            L1_1 = L3_1.utf8p2
            L2_1 = true
          else
            L3_1 = this_sigattrlog
            L3_1 = L3_1[8]
            L3_1 = L3_1.matched
            if L3_1 then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[8]
              L1_1 = L3_1.utf8p2
              L2_1 = true
            else
              L3_1 = this_sigattrlog
              L3_1 = L3_1[9]
              L3_1 = L3_1.matched
              if L3_1 then
                L3_1 = this_sigattrlog
                L3_1 = L3_1[9]
                L1_1 = L3_1.utf8p2
                L2_1 = true
              else
                L3_1 = this_sigattrlog
                L3_1 = L3_1[10]
                L3_1 = L3_1.matched
                if L3_1 then
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[10]
                  L1_1 = L3_1.utf8p2
                  L2_1 = true
                else
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[2]
                  L3_1 = L3_1.matched
                  if L3_1 then
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[2]
                    L1_1 = L3_1.utf8p2
                    L3_1 = MpCommon
                    L3_1 = L3_1.StringRegExpSearch
                    L4_1 = "exec\\s+(puma|thin|rails|mongrel) "
                    L5_1 = L1_1
                    L3_1 = L3_1(L4_1, L5_1)
                    if not L3_1 then
                      L3_1 = mp
                      L3_1 = L3_1.CLEAN
                      return L3_1
                    end
                  else
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[11]
                    L3_1 = L3_1.matched
                    if L3_1 then
                      L3_1 = this_sigattrlog
                      L3_1 = L3_1[11]
                      L1_1 = L3_1.utf8p2
                    else
                      L3_1 = this_sigattrlog
                      L3_1 = L3_1[12]
                      L3_1 = L3_1.matched
                      if L3_1 then
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[12]
                        L1_1 = L3_1.utf8p2
                      else
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[13]
                        L3_1 = L3_1.matched
                        if L3_1 then
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[13]
                          L1_1 = L3_1.utf8p2
                        else
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[14]
                          L3_1 = L3_1.matched
                          if L3_1 then
                            L3_1 = this_sigattrlog
                            L3_1 = L3_1[14]
                            L1_1 = L3_1.utf8p2
                          else
                            L3_1 = this_sigattrlog
                            L3_1 = L3_1[15]
                            L3_1 = L3_1.matched
                            if L3_1 then
                              L3_1 = this_sigattrlog
                              L3_1 = L3_1[15]
                              L1_1 = L3_1.utf8p2
                            else
                              L3_1 = this_sigattrlog
                              L3_1 = L3_1[16]
                              L3_1 = L3_1.matched
                              if L3_1 then
                                L3_1 = this_sigattrlog
                                L3_1 = L3_1[16]
                                L1_1 = L3_1.utf8p2
                              else
                                L3_1 = this_sigattrlog
                                L3_1 = L3_1[17]
                                L3_1 = L3_1.matched
                                if L3_1 then
                                  L3_1 = this_sigattrlog
                                  L3_1 = L3_1[17]
                                  L1_1 = L3_1.utf8p2
                                else
                                  L3_1 = this_sigattrlog
                                  L3_1 = L3_1[18]
                                  L3_1 = L3_1.matched
                                  if L3_1 then
                                    L3_1 = this_sigattrlog
                                    L3_1 = L3_1[18]
                                    L1_1 = L3_1.utf8p2
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
if not L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L1_1
L3_1 = L1_1.match
L5_1 = "-a%s+([%d%.]+)"
L3_1 = L3_1(L4_1, L5_1)
L5_1 = L1_1
L4_1 = L1_1.match
L6_1 = "-p%s+([%d]+)"
L4_1 = L4_1(L5_1, L6_1)
if not L3_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if L3_1 and (L3_1 == "127.0.0.1" or L4_1 == "0.0.0.0") then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L3_1
L6_1 = ":"
L7_1 = L4_1
L5_1 = L5_1 .. L6_1 .. L7_1
if not L5_1 then
  L5_1 = "default"
end
L6_1 = "ruby_webservers_config"
L7_1 = 31536000
L8_1 = 50
L9_1 = AppendToRollingQueue
L10_1 = L6_1
L11_1 = "IP/PORT"
L12_1 = L5_1
L13_1 = L7_1
L14_1 = L8_1
L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
L9_1 = nil
if L2_1 then
  L10_1 = GetPidFromParentImagePath
  L11_1 = "ruby.exe"
  L10_1 = L10_1(L11_1)
  L9_1 = L10_1
else
  L10_1 = bm
  L10_1 = L10_1.get_current_process_startup_info
  L10_1 = L10_1()
  if L10_1 then
    L11_1 = L10_1.ppid
    if L11_1 then
      L9_1 = L10_1.ppid
    end
  end
end
if not L9_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = {}
L10_1.AppName = "ruby.exe"
L11_1 = getWebApplicationType
L12_1 = L9_1
L11_1 = L11_1(L12_1)
L10_1.WebAppName = L11_1
L10_1.Pid = L9_1
L10_1.AppCategory = "PFServers"
L10_1.Score = 0
L11_1 = MpCommon
L11_1 = L11_1.DoesProcessHaveAttribute
L12_1 = L9_1
L13_1 = "PFApp_Parent"
L11_1 = L11_1(L12_1, L13_1)
if not L11_1 then
  L11_1 = pcall
  L12_1 = MpCommon
  L12_1 = L12_1.AddProcessAttribute
  L13_1 = L9_1
  L14_1 = "PFApp_Parent"
  L15_1 = safeJsonSerialize
  L16_1 = L10_1
  L15_1 = L15_1(L16_1)
  L16_1 = true
  L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
  if not L11_1 then
    L13_1 = {}
    L13_1.err = L12_1
    L13_1.AttributeValue = L10_1
    L13_1.SignatureName = "SetProcAttribRBY.A"
    L13_1.ProcessName = L0_1
    L14_1 = bm
    L14_1 = L14_1.trigger_sig
    L15_1 = "ProcAttribError"
    L16_1 = safeJsonSerialize
    L17_1 = L13_1
    L16_1, L17_1 = L16_1(L17_1)
    L14_1(L15_1, L16_1, L17_1)
  end
  if not L2_1 then
    L13_1 = {}
    L13_1.AttributeValue = L10_1
    L13_1.SignatureName = "SetProcAttribRBY.A"
    L13_1.ProcessName = L0_1
    L14_1 = bm
    L14_1 = L14_1.trigger_sig
    L15_1 = "SetProcessAttrib"
    L16_1 = safeJsonSerialize
    L17_1 = L13_1
    L16_1, L17_1 = L16_1(L17_1)
    L14_1(L15_1, L16_1, L17_1)
  end
end
L11_1 = bm
L11_1 = L11_1.trigger_sig
L12_1 = "SetProcessAttrib_RubyServr"
L13_1 = safeJsonSerialize
L14_1 = L10_1
L13_1, L14_1, L15_1, L16_1, L17_1 = L13_1(L14_1)
L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
