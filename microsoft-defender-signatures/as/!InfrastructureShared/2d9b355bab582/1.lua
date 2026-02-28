local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L1_1 = 2
L2_1 = nil
L3_1 = 30
L4_1 = 5
L5_1 = nil
L6_1 = nil
L7_1 = "rqsecuritysoftwaredisc"
L8_1 = this_sigattrlog
L8_1 = L8_1[1]
L8_1 = L8_1.matched
if L8_1 then
  L2_1 = "mdatp"
else
  L8_1 = this_sigattrlog
  L8_1 = L8_1[2]
  L8_1 = L8_1.matched
  if L8_1 then
    L2_1 = "firewall"
  else
    L8_1 = this_sigattrlog
    L8_1 = L8_1[3]
    L8_1 = L8_1.matched
    if L8_1 then
      L2_1 = "littlesnitch"
    else
      L8_1 = this_sigattrlog
      L8_1 = L8_1[4]
      L8_1 = L8_1.matched
      if L8_1 then
        L2_1 = "opensnitch"
      else
        L8_1 = this_sigattrlog
        L8_1 = L8_1[5]
        L8_1 = L8_1.matched
        if L8_1 then
          L2_1 = "avast"
        else
          L8_1 = this_sigattrlog
          L8_1 = L8_1[6]
          L8_1 = L8_1.matched
          if L8_1 then
            L2_1 = "avira"
          else
            L8_1 = this_sigattrlog
            L8_1 = L8_1[7]
            L8_1 = L8_1.matched
            if L8_1 then
              L2_1 = "mcafee"
            else
              L8_1 = this_sigattrlog
              L8_1 = L8_1[8]
              L8_1 = L8_1.matched
              if L8_1 then
                L2_1 = "webprotection"
              else
                L8_1 = this_sigattrlog
                L8_1 = L8_1[9]
                L8_1 = L8_1.matched
                if L8_1 then
                  L2_1 = "isecespd"
                else
                  L8_1 = this_sigattrlog
                  L8_1 = L8_1[10]
                  L8_1 = L8_1.matched
                  if L8_1 then
                    L2_1 = "macmnsvc"
                  else
                    L8_1 = this_sigattrlog
                    L8_1 = L8_1[12]
                    L8_1 = L8_1.matched
                    if L8_1 then
                      L2_1 = "avscan"
                    else
                      L8_1 = this_sigattrlog
                      L8_1 = L8_1[13]
                      L8_1 = L8_1.matched
                      if L8_1 then
                        L2_1 = "rtvscand"
                      else
                        L8_1 = this_sigattrlog
                        L8_1 = L8_1[14]
                        L8_1 = L8_1.matched
                        if L8_1 then
                          L2_1 = "symcfgd"
                        else
                          L8_1 = this_sigattrlog
                          L8_1 = L8_1[15]
                          L8_1 = L8_1.matched
                          if L8_1 then
                            L2_1 = "scmdaemon"
                          else
                            L8_1 = this_sigattrlog
                            L8_1 = L8_1[16]
                            L8_1 = L8_1.matched
                            if L8_1 then
                              L2_1 = "symantec"
                            else
                              L8_1 = this_sigattrlog
                              L8_1 = L8_1[17]
                              L8_1 = L8_1.matched
                              if L8_1 then
                                L2_1 = "osquery"
                              else
                                L8_1 = this_sigattrlog
                                L8_1 = L8_1[18]
                                L8_1 = L8_1.matched
                                if L8_1 then
                                  L2_1 = "sophos"
                                else
                                  L8_1 = this_sigattrlog
                                  L8_1 = L8_1[19]
                                  L8_1 = L8_1.matched
                                  if L8_1 then
                                    L2_1 = "elastic"
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
L8_1 = pcall
L9_1 = MpCommon
L9_1 = L9_1.RollingQueueCreate
L10_1 = L7_1
L11_1 = L4_1
L12_1 = L3_1
L13_1 = 1
L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
L6_1 = L9_1
L5_1 = L8_1
if not L5_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = pcall
L9_1 = MpCommon
L9_1 = L9_1.RollingQueueAppend
L10_1 = L7_1
L11_1 = L2_1
L12_1 = ""
L13_1 = L3_1
L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
L6_1 = L9_1
L5_1 = L8_1
if not L5_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = pcall
L9_1 = MpCommon
L9_1 = L9_1.RollingQueueCount
L10_1 = L7_1
L8_1, L9_1 = L8_1(L9_1, L10_1)
L6_1 = L9_1
L5_1 = L8_1
if not L5_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L0_1 = L6_1
if L1_1 < L0_1 then
  L8_1 = TrackPidAndTechniqueBM
  L9_1 = "BM"
  L10_1 = "T1518.001"
  L11_1 = "SecuritySoftwareDiscovery"
  L8_1(L9_1, L10_1, L11_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
