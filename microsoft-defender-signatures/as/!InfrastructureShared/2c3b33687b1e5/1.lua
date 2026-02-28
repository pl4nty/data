local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
L5_1 = "werfault.exe"
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
  L3_1 = L3_1.utf8p1
  L4_1 = L3_1
  L3_1 = L3_1.match
  L5_1 = "([^\\]+)$"
  L3_1 = L3_1(L4_1, L5_1)
  L1_1 = L3_1
  L2_1 = true
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p1
    L4_1 = L3_1
    L3_1 = L3_1.match
    L5_1 = "([^\\]+)$"
    L3_1 = L3_1(L4_1, L5_1)
    L1_1 = L3_1
    L2_1 = true
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.utf8p1
      L4_1 = L3_1
      L3_1 = L3_1.match
      L5_1 = "([^\\]+)$"
      L3_1 = L3_1(L4_1, L5_1)
      L1_1 = L3_1
      L2_1 = true
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.utf8p1
        L4_1 = L3_1
        L3_1 = L3_1.match
        L5_1 = "([^\\]+)$"
        L3_1 = L3_1(L4_1, L5_1)
        L1_1 = L3_1
        L2_1 = true
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[5]
          L3_1 = L3_1.utf8p1
          L4_1 = L3_1
          L3_1 = L3_1.match
          L5_1 = "([^\\]+)$"
          L3_1 = L3_1(L4_1, L5_1)
          L1_1 = L3_1
          L2_1 = true
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[6]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[6]
            L3_1 = L3_1.utf8p1
            L4_1 = L3_1
            L3_1 = L3_1.match
            L5_1 = "([^\\]+)$"
            L3_1 = L3_1(L4_1, L5_1)
            L1_1 = L3_1
          else
            L3_1 = this_sigattrlog
            L3_1 = L3_1[7]
            L3_1 = L3_1.matched
            if L3_1 then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[7]
              L3_1 = L3_1.utf8p1
              L4_1 = L3_1
              L3_1 = L3_1.match
              L5_1 = "([^\\]+)$"
              L3_1 = L3_1(L4_1, L5_1)
              L1_1 = L3_1
            else
              L3_1 = this_sigattrlog
              L3_1 = L3_1[8]
              L3_1 = L3_1.matched
              if L3_1 then
                L3_1 = this_sigattrlog
                L3_1 = L3_1[8]
                L3_1 = L3_1.utf8p1
                L4_1 = L3_1
                L3_1 = L3_1.match
                L5_1 = "([^\\]+)$"
                L3_1 = L3_1(L4_1, L5_1)
                L1_1 = L3_1
              else
                L3_1 = this_sigattrlog
                L3_1 = L3_1[9]
                L3_1 = L3_1.matched
                if L3_1 then
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[9]
                  L3_1 = L3_1.utf8p1
                  L4_1 = L3_1
                  L3_1 = L3_1.match
                  L5_1 = "([^\\]+)$"
                  L3_1 = L3_1(L4_1, L5_1)
                  L1_1 = L3_1
                else
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[10]
                  L3_1 = L3_1.matched
                  if L3_1 then
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[10]
                    L3_1 = L3_1.utf8p1
                    L4_1 = L3_1
                    L3_1 = L3_1.match
                    L5_1 = "([^\\]+)$"
                    L3_1 = L3_1(L4_1, L5_1)
                    L1_1 = L3_1
                  else
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[11]
                    L3_1 = L3_1.matched
                    if L3_1 then
                      L2_1 = true
                      L3_1 = this_sigattrlog
                      L3_1 = L3_1[11]
                      L3_1 = L3_1.utf8p2
                      L4_1 = L3_1
                      L3_1 = L3_1.find
                      L5_1 = ".home=.* start"
                      L3_1 = L3_1(L4_1, L5_1)
                      if L3_1 then
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[11]
                        L3_1 = L3_1.utf8p1
                        L4_1 = L3_1
                        L3_1 = L3_1.match
                        L5_1 = "([^\\]+)$"
                        L3_1 = L3_1(L4_1, L5_1)
                        L1_1 = L3_1
                      end
                    else
                      L3_1 = this_sigattrlog
                      L3_1 = L3_1[12]
                      L3_1 = L3_1.matched
                      if L3_1 then
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[12]
                        L3_1 = L3_1.utf8p2
                        L4_1 = L3_1
                        L3_1 = L3_1.find
                        L5_1 = ".home=.* start"
                        L3_1 = L3_1(L4_1, L5_1)
                        if L3_1 then
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[12]
                          L3_1 = L3_1.utf8p1
                          L4_1 = L3_1
                          L3_1 = L3_1.match
                          L5_1 = "([^\\]+)$"
                          L3_1 = L3_1(L4_1, L5_1)
                          L1_1 = L3_1
                        end
                      else
                        L3_1 = this_sigattrlog
                        L3_1 = L3_1[13]
                        L3_1 = L3_1.matched
                        if L3_1 then
                          L2_1 = true
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[13]
                          L3_1 = L3_1.utf8p1
                          L4_1 = L3_1
                          L3_1 = L3_1.match
                          L5_1 = "([^\\]+)$"
                          L3_1 = L3_1(L4_1, L5_1)
                          L1_1 = L3_1
                        else
                          L3_1 = this_sigattrlog
                          L3_1 = L3_1[14]
                          L3_1 = L3_1.matched
                          if L3_1 then
                            L3_1 = this_sigattrlog
                            L3_1 = L3_1[14]
                            L3_1 = L3_1.utf8p1
                            L4_1 = L3_1
                            L3_1 = L3_1.match
                            L5_1 = "([^\\]+)$"
                            L3_1 = L3_1(L4_1, L5_1)
                            L1_1 = L3_1
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
L3_1 = nil
if L2_1 then
  L4_1 = GetPidFromParentImagePath
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
else
  L4_1 = bm
  L4_1 = L4_1.get_current_process_startup_info
  L4_1 = L4_1()
  if L4_1 then
    L5_1 = L4_1.ppid
    if L5_1 then
      L3_1 = L4_1.ppid
    end
  end
end
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L4_1.AppName = L1_1
L4_1.Pid = L3_1
L4_1.AppCategory = "PFServers"
L5_1 = getWebApplicationType
L6_1 = L3_1
L5_1 = L5_1(L6_1)
L4_1.WebAppName = L5_1
L4_1.Score = 0
L5_1 = MpCommon
L5_1 = L5_1.DoesProcessHaveAttribute
L6_1 = L3_1
L7_1 = "PFApp_Parent"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = pcall
  L6_1 = MpCommon
  L6_1 = L6_1.AddProcessAttribute
  L7_1 = L3_1
  L8_1 = "PFApp_Parent"
  L9_1 = safeJsonSerialize
  L10_1 = L4_1
  L9_1 = L9_1(L10_1)
  L10_1 = true
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
  if not L5_1 then
    L7_1 = {}
    L7_1.err = L6_1
    L7_1.AttributeValue = L4_1
    L7_1.SignatureName = "PFA_Parent.A"
    L7_1.ProcessName = L0_1
    L8_1 = bm
    L8_1 = L8_1.trigger_sig
    L9_1 = "ProcAttribError"
    L10_1 = safeJsonSerialize
    L11_1 = L7_1
    L10_1, L11_1 = L10_1(L11_1)
    L8_1(L9_1, L10_1, L11_1)
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
