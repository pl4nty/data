local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = versioning
L0_1 = L0_1.GetTestMode
L0_1 = L0_1()
if L0_1 ~= 65000 then
  L0_1 = versioning
  L0_1 = L0_1.GetCloudBlockLevel
  L0_1 = L0_1()
  if L0_1 < 4 then
    L0_1 = MpCommon
    L0_1 = L0_1.IsSampled
    L1_1 = 1000
    L2_1 = true
    L3_1 = true
    L4_1 = true
    L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
    if L0_1 == false then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L0_1 = L2_1.utf8p1
  L1_1 = 2
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L0_1 = L2_1.utf8p1
    L1_1 = 6
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[7]
      L0_1 = L2_1.utf8p1
      L1_1 = 17
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[8]
        L0_1 = L2_1.utf8p1
        L1_1 = 18
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[9]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[9]
          L0_1 = L2_1.utf8p1
          L1_1 = 24
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[10]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[10]
            L0_1 = L2_1.utf8p1
            L1_1 = 25
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[11]
            L2_1 = L2_1.matched
            if L2_1 then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[11]
              L0_1 = L2_1.utf8p1
              L1_1 = 28
            else
              L2_1 = this_sigattrlog
              L2_1 = L2_1[12]
              L2_1 = L2_1.matched
              if L2_1 then
                L2_1 = this_sigattrlog
                L2_1 = L2_1[12]
                L0_1 = L2_1.utf8p1
                L1_1 = 29
              else
                L2_1 = this_sigattrlog
                L2_1 = L2_1[13]
                L2_1 = L2_1.matched
                if L2_1 then
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[13]
                  L0_1 = L2_1.utf8p1
                  L1_1 = 33
                else
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[14]
                  L2_1 = L2_1.matched
                  if L2_1 then
                    L2_1 = this_sigattrlog
                    L2_1 = L2_1[14]
                    L0_1 = L2_1.utf8p1
                    L1_1 = 35
                  else
                    L2_1 = this_sigattrlog
                    L2_1 = L2_1[15]
                    L2_1 = L2_1.matched
                    if L2_1 then
                      L2_1 = this_sigattrlog
                      L2_1 = L2_1[15]
                      L0_1 = L2_1.utf8p1
                      L1_1 = 36
                    else
                      L2_1 = this_sigattrlog
                      L2_1 = L2_1[16]
                      L2_1 = L2_1.matched
                      if L2_1 then
                        L2_1 = this_sigattrlog
                        L2_1 = L2_1[16]
                        L0_1 = L2_1.utf8p1
                        L1_1 = 37
                      else
                        L2_1 = this_sigattrlog
                        L2_1 = L2_1[17]
                        L2_1 = L2_1.matched
                        if L2_1 then
                          L2_1 = this_sigattrlog
                          L2_1 = L2_1[17]
                          L0_1 = L2_1.utf8p1
                          L1_1 = 42
                        else
                          L2_1 = this_sigattrlog
                          L2_1 = L2_1[18]
                          L2_1 = L2_1.matched
                          if L2_1 then
                            L2_1 = this_sigattrlog
                            L2_1 = L2_1[18]
                            L0_1 = L2_1.utf8p1
                            L1_1 = 43
                          else
                            L2_1 = this_sigattrlog
                            L2_1 = L2_1[19]
                            L2_1 = L2_1.matched
                            if L2_1 then
                              L2_1 = this_sigattrlog
                              L2_1 = L2_1[19]
                              L0_1 = L2_1.utf8p1
                              L1_1 = 44
                            else
                              L2_1 = this_sigattrlog
                              L2_1 = L2_1[20]
                              L2_1 = L2_1.matched
                              if L2_1 then
                                L2_1 = this_sigattrlog
                                L2_1 = L2_1[20]
                                L0_1 = L2_1.utf8p1
                                L1_1 = 45
                              else
                                L2_1 = this_sigattrlog
                                L2_1 = L2_1[21]
                                L2_1 = L2_1.matched
                                if L2_1 then
                                  L2_1 = this_sigattrlog
                                  L2_1 = L2_1[21]
                                  L0_1 = L2_1.utf8p1
                                  L1_1 = 46
                                else
                                  L2_1 = this_sigattrlog
                                  L2_1 = L2_1[23]
                                  L2_1 = L2_1.matched
                                  if L2_1 then
                                    L2_1 = this_sigattrlog
                                    L2_1 = L2_1[23]
                                    L0_1 = L2_1.utf8p1
                                    L1_1 = 48
                                  else
                                    L2_1 = this_sigattrlog
                                    L2_1 = L2_1[22]
                                    L2_1 = L2_1.matched
                                    if L2_1 then
                                      L2_1 = this_sigattrlog
                                      L2_1 = L2_1[22]
                                      L0_1 = L2_1.utf8p1
                                      L1_1 = 47
                                    else
                                      L2_1 = this_sigattrlog
                                      L2_1 = L2_1[24]
                                      L2_1 = L2_1.matched
                                      if L2_1 then
                                        L2_1 = this_sigattrlog
                                        L2_1 = L2_1[24]
                                        L0_1 = L2_1.utf8p1
                                        L1_1 = 49
                                      else
                                        L2_1 = this_sigattrlog
                                        L2_1 = L2_1[25]
                                        L2_1 = L2_1.matched
                                        if L2_1 then
                                          L2_1 = this_sigattrlog
                                          L2_1 = L2_1[25]
                                          L0_1 = L2_1.utf8p1
                                          L1_1 = 50
                                        else
                                          L2_1 = this_sigattrlog
                                          L2_1 = L2_1[26]
                                          L2_1 = L2_1.matched
                                          if L2_1 then
                                            L2_1 = this_sigattrlog
                                            L2_1 = L2_1[26]
                                            L0_1 = L2_1.utf8p1
                                            L1_1 = 51
                                          else
                                            L2_1 = this_sigattrlog
                                            L2_1 = L2_1[27]
                                            L2_1 = L2_1.matched
                                            if L2_1 then
                                              L2_1 = this_sigattrlog
                                              L2_1 = L2_1[27]
                                              L0_1 = L2_1.utf8p1
                                              L1_1 = 52
                                            else
                                              L2_1 = this_sigattrlog
                                              L2_1 = L2_1[28]
                                              L2_1 = L2_1.matched
                                              if L2_1 then
                                                L2_1 = this_sigattrlog
                                                L2_1 = L2_1[28]
                                                L0_1 = L2_1.utf8p1
                                                L1_1 = 53
                                              else
                                                L2_1 = this_sigattrlog
                                                L2_1 = L2_1[29]
                                                L2_1 = L2_1.matched
                                                if L2_1 then
                                                  L2_1 = this_sigattrlog
                                                  L2_1 = L2_1[29]
                                                  L0_1 = L2_1.utf8p1
                                                  L1_1 = 55
                                                else
                                                  L2_1 = this_sigattrlog
                                                  L2_1 = L2_1[30]
                                                  L2_1 = L2_1.matched
                                                  if L2_1 then
                                                    L2_1 = this_sigattrlog
                                                    L2_1 = L2_1[30]
                                                    L0_1 = L2_1.utf8p1
                                                    L1_1 = 59
                                                  else
                                                    L2_1 = this_sigattrlog
                                                    L2_1 = L2_1[31]
                                                    L2_1 = L2_1.matched
                                                    if L2_1 then
                                                      L2_1 = this_sigattrlog
                                                      L2_1 = L2_1[31]
                                                      L0_1 = L2_1.utf8p1
                                                      L1_1 = 60
                                                    else
                                                      L2_1 = this_sigattrlog
                                                      L2_1 = L2_1[32]
                                                      L2_1 = L2_1.matched
                                                      if L2_1 then
                                                        L2_1 = this_sigattrlog
                                                        L2_1 = L2_1[32]
                                                        L0_1 = L2_1.utf8p1
                                                        L1_1 = 61
                                                      else
                                                        L2_1 = this_sigattrlog
                                                        L2_1 = L2_1[33]
                                                        L2_1 = L2_1.matched
                                                        if L2_1 then
                                                          L2_1 = this_sigattrlog
                                                          L2_1 = L2_1[33]
                                                          L0_1 = L2_1.utf8p1
                                                          L1_1 = 62
                                                        else
                                                          L2_1 = this_sigattrlog
                                                          L2_1 = L2_1[34]
                                                          L2_1 = L2_1.matched
                                                          if L2_1 then
                                                            L2_1 = this_sigattrlog
                                                            L2_1 = L2_1[34]
                                                            L0_1 = L2_1.utf8p1
                                                            L1_1 = 63
                                                          else
                                                            L2_1 = this_sigattrlog
                                                            L2_1 = L2_1[35]
                                                            L2_1 = L2_1.matched
                                                            if L2_1 then
                                                              L2_1 = this_sigattrlog
                                                              L2_1 = L2_1[35]
                                                              L0_1 = L2_1.utf8p1
                                                              L1_1 = 249
                                                            else
                                                              L2_1 = this_sigattrlog
                                                              L2_1 = L2_1[36]
                                                              L2_1 = L2_1.matched
                                                              if L2_1 then
                                                                L2_1 = this_sigattrlog
                                                                L2_1 = L2_1[36]
                                                                L0_1 = L2_1.utf8p1
                                                                L1_1 = 250
                                                              else
                                                                L2_1 = this_sigattrlog
                                                                L2_1 = L2_1[37]
                                                                L2_1 = L2_1.matched
                                                                if L2_1 then
                                                                  L2_1 = this_sigattrlog
                                                                  L2_1 = L2_1[37]
                                                                  L0_1 = L2_1.utf8p1
                                                                  L1_1 = 251
                                                                else
                                                                  L2_1 = this_sigattrlog
                                                                  L2_1 = L2_1[38]
                                                                  L2_1 = L2_1.matched
                                                                  if L2_1 then
                                                                    L2_1 = this_sigattrlog
                                                                    L2_1 = L2_1[38]
                                                                    L0_1 = L2_1.utf8p1
                                                                    L1_1 = 252
                                                                  else
                                                                    L2_1 = this_sigattrlog
                                                                    L2_1 = L2_1[39]
                                                                    L2_1 = L2_1.matched
                                                                    if L2_1 then
                                                                      L2_1 = this_sigattrlog
                                                                      L2_1 = L2_1[39]
                                                                      L0_1 = L2_1.utf8p1
                                                                      L1_1 = 255
                                                                    else
                                                                      L2_1 = this_sigattrlog
                                                                      L2_1 = L2_1[40]
                                                                      L2_1 = L2_1.matched
                                                                      if L2_1 then
                                                                        L2_1 = this_sigattrlog
                                                                        L2_1 = L2_1[40]
                                                                        L0_1 = L2_1.utf8p1
                                                                        L1_1 = 257
                                                                      else
                                                                        L2_1 = mp
                                                                        L2_1 = L2_1.CLEAN
                                                                        return L2_1
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
              end
            end
          end
        end
      end
    end
  end
end
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "[%w%-%.]*%.[%w%-]+%.[%w]+"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = lastIndexOf
L3_1 = L0_1
L4_1 = "."
L5_1 = #L0_1
L5_1 = L5_1 - 7
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = string
L4_1 = L4_1.sub
L5_1 = L0_1
L6_1 = L2_1 + 1
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1
L5_1 = "_"
L6_1 = L1_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = "NRI-DNS-EXF-NONA"
L6_1 = string
L6_1 = L6_1.format
L7_1 = "%s_%s_%s"
L8_1 = L5_1
L9_1 = L3_1
L10_1 = L1_1
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
L7_1 = MpCommon
L7_1 = L7_1.GetPersistContextCountNoPath
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 and 0 < L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = this_sigattrlog
L8_1 = L8_1[3]
L8_1 = L8_1.np1
if not L8_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.bitand
L10_1 = L8_1
L11_1 = 65535
L9_1 = L9_1(L10_1, L11_1)
L8_1 = L9_1
L9_1 = mp
L9_1 = L9_1.CheckUrl
L10_1 = L3_1
L9_1, L10_1 = L9_1(L10_1)
if L9_1 == 1 and L10_1 == 1 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = string
L11_1 = L11_1.sub
L12_1 = L0_1
L13_1 = 1
L14_1 = L2_1 - 1
L11_1 = L11_1(L12_1, L13_1, L14_1)
L12_1 = versioning
L12_1 = L12_1.GetTestMode
L12_1 = L12_1()
if L12_1 ~= 65000 then
  L12_1 = computeStringScores
  L13_1 = L11_1
  L12_1, L13_1, L14_1, L15_1 = L12_1(L13_1)
  if (not (0 < L13_1) or not (1 < L12_1)) and not (3 < L15_1) and not (5 < L14_1) then
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    return L16_1
  end
end
L12_1 = MpCommon
L12_1 = L12_1.GetPersistContextCountNoPath
L13_1 = L4_1
L12_1 = L12_1(L13_1)
if L12_1 < 20 then
  L13_1 = MpCommon
  L13_1 = L13_1.QueryPersistContextNoPath
  L14_1 = L4_1
  L15_1 = L11_1
  L13_1 = L13_1(L14_1, L15_1)
  if not L13_1 then
    L14_1 = computeReponseLength
    L15_1 = L8_1
    L14_1 = L14_1(L15_1)
    L15_1 = MpCommon
    L15_1 = L15_1.AppendPersistContextNoPath
    L16_1 = L4_1
    L17_1 = L11_1
    L18_1 = 3600
    L15_1(L16_1, L17_1, L18_1)
    L15_1 = MpCommon
    L15_1 = L15_1.AppendPersistContextNoPath
    L16_1 = L4_1
    L17_1 = "T"
    L16_1 = L16_1 .. L17_1
    L17_1 = MpCommon
    L17_1 = L17_1.GetCurrentTimeT
    L17_1 = L17_1()
    L18_1 = "_"
    L19_1 = #L11_1
    L20_1 = "_"
    L21_1 = L14_1
    L17_1 = L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1
    L18_1 = 3600
    L15_1(L16_1, L17_1, L18_1)
    L12_1 = L12_1 + 1
  end
end
if L12_1 == 20 then
  L13_1 = MpCommon
  L13_1 = L13_1.GetPersistContextNoPath
  L14_1 = L4_1
  L13_1 = L13_1(L14_1)
  L14_1 = extractCommonSuffix
  L15_1 = L13_1
  L16_1 = 0
  L14_1, L15_1 = L14_1(L15_1, L16_1)
  L16_1 = computeDataLength
  L17_1 = L13_1
  L18_1 = #L15_1
  L16_1 = L16_1(L17_1, L18_1)
  L17_1 = #L15_1
  L17_1 = L17_1 + L16_1
  if L17_1 < 40 or L16_1 < 20 then
    L18_1 = mp
    L18_1 = L18_1.changedetectionname
    L19_1 = 805306724
    L18_1(L19_1)
  else
    L18_1 = this_sigattrlog
    L18_1 = L18_1[2]
    L18_1 = L18_1.utf8p1
    L19_1 = routeBasedOnProcess
    L20_1 = L18_1
    L21_1 = 1
    L19_1 = L19_1(L20_1, L21_1)
    L20_1 = mp
    L20_1 = L20_1.changedetectionname
    L21_1 = L19_1
    L20_1(L21_1)
  end
  L18_1 = MpCommon
  L18_1 = L18_1.QueryPersistContextNoPath
  L19_1 = L5_1
  L20_1 = L4_1
  L18_1 = L18_1(L19_1, L20_1)
  if not L18_1 then
    L18_1 = MpCommon
    L18_1 = L18_1.AppendPersistContextNoPath
    L19_1 = L5_1
    L20_1 = L4_1
    L21_1 = 60
    L18_1(L19_1, L20_1, L21_1)
  end
  L18_1 = mp
  L18_1 = L18_1.INFECTED
  return L18_1
end
L13_1 = mp
L13_1 = L13_1.CLEAN
return L13_1
