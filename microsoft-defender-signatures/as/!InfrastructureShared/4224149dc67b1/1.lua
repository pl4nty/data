local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = versioning
L0_1 = L0_1.GetTestMode
L0_1 = L0_1()
if L0_1 ~= 65000 then
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
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L0_1 = L2_1.utf8p1
  L1_1 = 3
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L0_1 = L2_1.utf8p1
    L1_1 = 4
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[7]
      L0_1 = L2_1.utf8p1
      L1_1 = 7
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[8]
        L0_1 = L2_1.utf8p1
        L1_1 = 8
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[9]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[9]
          L0_1 = L2_1.utf8p1
          L1_1 = 9
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[10]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[10]
            L0_1 = L2_1.utf8p1
            L1_1 = 10
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[11]
            L2_1 = L2_1.matched
            if L2_1 then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[11]
              L0_1 = L2_1.utf8p1
              L1_1 = 11
            else
              L2_1 = this_sigattrlog
              L2_1 = L2_1[12]
              L2_1 = L2_1.matched
              if L2_1 then
                L2_1 = this_sigattrlog
                L2_1 = L2_1[12]
                L0_1 = L2_1.utf8p1
                L1_1 = 13
              else
                L2_1 = this_sigattrlog
                L2_1 = L2_1[13]
                L2_1 = L2_1.matched
                if L2_1 then
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[13]
                  L0_1 = L2_1.utf8p1
                  L1_1 = 14
                else
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[14]
                  L2_1 = L2_1.matched
                  if L2_1 then
                    L2_1 = this_sigattrlog
                    L2_1 = L2_1[14]
                    L0_1 = L2_1.utf8p1
                    L1_1 = 19
                  else
                    L2_1 = this_sigattrlog
                    L2_1 = L2_1[15]
                    L2_1 = L2_1.matched
                    if L2_1 then
                      L2_1 = this_sigattrlog
                      L2_1 = L2_1[15]
                      L0_1 = L2_1.utf8p1
                      L1_1 = 20
                    else
                      L2_1 = this_sigattrlog
                      L2_1 = L2_1[16]
                      L2_1 = L2_1.matched
                      if L2_1 then
                        L2_1 = this_sigattrlog
                        L2_1 = L2_1[16]
                        L0_1 = L2_1.utf8p1
                        L1_1 = 21
                      else
                        L2_1 = this_sigattrlog
                        L2_1 = L2_1[17]
                        L2_1 = L2_1.matched
                        if L2_1 then
                          L2_1 = this_sigattrlog
                          L2_1 = L2_1[17]
                          L0_1 = L2_1.utf8p1
                          L1_1 = 22
                        else
                          L2_1 = this_sigattrlog
                          L2_1 = L2_1[18]
                          L2_1 = L2_1.matched
                          if L2_1 then
                            L2_1 = this_sigattrlog
                            L2_1 = L2_1[18]
                            L0_1 = L2_1.utf8p1
                            L1_1 = 23
                          else
                            L2_1 = this_sigattrlog
                            L2_1 = L2_1[19]
                            L2_1 = L2_1.matched
                            if L2_1 then
                              L2_1 = this_sigattrlog
                              L2_1 = L2_1[19]
                              L0_1 = L2_1.utf8p1
                              L1_1 = 26
                            else
                              L2_1 = this_sigattrlog
                              L2_1 = L2_1[20]
                              L2_1 = L2_1.matched
                              if L2_1 then
                                L2_1 = this_sigattrlog
                                L2_1 = L2_1[20]
                                L0_1 = L2_1.utf8p1
                                L1_1 = 27
                              else
                                L2_1 = this_sigattrlog
                                L2_1 = L2_1[21]
                                L2_1 = L2_1.matched
                                if L2_1 then
                                  L2_1 = this_sigattrlog
                                  L2_1 = L2_1[21]
                                  L0_1 = L2_1.utf8p1
                                  L1_1 = 30
                                else
                                  L2_1 = this_sigattrlog
                                  L2_1 = L2_1[22]
                                  L2_1 = L2_1.matched
                                  if L2_1 then
                                    L2_1 = this_sigattrlog
                                    L2_1 = L2_1[22]
                                    L0_1 = L2_1.utf8p1
                                    L1_1 = 31
                                  else
                                    L2_1 = this_sigattrlog
                                    L2_1 = L2_1[23]
                                    L2_1 = L2_1.matched
                                    if L2_1 then
                                      L2_1 = this_sigattrlog
                                      L2_1 = L2_1[23]
                                      L0_1 = L2_1.utf8p1
                                      L1_1 = 32
                                    else
                                      L2_1 = this_sigattrlog
                                      L2_1 = L2_1[24]
                                      L2_1 = L2_1.matched
                                      if L2_1 then
                                        L2_1 = this_sigattrlog
                                        L2_1 = L2_1[24]
                                        L0_1 = L2_1.utf8p1
                                        L1_1 = 34
                                      else
                                        L2_1 = this_sigattrlog
                                        L2_1 = L2_1[25]
                                        L2_1 = L2_1.matched
                                        if L2_1 then
                                          L2_1 = this_sigattrlog
                                          L2_1 = L2_1[25]
                                          L0_1 = L2_1.utf8p1
                                          L1_1 = 38
                                        else
                                          L2_1 = this_sigattrlog
                                          L2_1 = L2_1[26]
                                          L2_1 = L2_1.matched
                                          if L2_1 then
                                            L2_1 = this_sigattrlog
                                            L2_1 = L2_1[26]
                                            L0_1 = L2_1.utf8p1
                                            L1_1 = 40
                                          else
                                            L2_1 = this_sigattrlog
                                            L2_1 = L2_1[27]
                                            L2_1 = L2_1.matched
                                            if L2_1 then
                                              L2_1 = this_sigattrlog
                                              L2_1 = L2_1[27]
                                              L0_1 = L2_1.utf8p1
                                              L1_1 = 56
                                            else
                                              L2_1 = this_sigattrlog
                                              L2_1 = L2_1[28]
                                              L2_1 = L2_1.matched
                                              if L2_1 then
                                                L2_1 = this_sigattrlog
                                                L2_1 = L2_1[28]
                                                L0_1 = L2_1.utf8p1
                                                L1_1 = 57
                                              else
                                                L2_1 = this_sigattrlog
                                                L2_1 = L2_1[29]
                                                L2_1 = L2_1.matched
                                                if L2_1 then
                                                  L2_1 = this_sigattrlog
                                                  L2_1 = L2_1[29]
                                                  L0_1 = L2_1.utf8p1
                                                  L1_1 = 58
                                                else
                                                  L2_1 = this_sigattrlog
                                                  L2_1 = L2_1[30]
                                                  L2_1 = L2_1.matched
                                                  if L2_1 then
                                                    L2_1 = this_sigattrlog
                                                    L2_1 = L2_1[30]
                                                    L0_1 = L2_1.utf8p1
                                                    L1_1 = 99
                                                  else
                                                    L2_1 = this_sigattrlog
                                                    L2_1 = L2_1[31]
                                                    L2_1 = L2_1.matched
                                                    if L2_1 then
                                                      L2_1 = this_sigattrlog
                                                      L2_1 = L2_1[31]
                                                      L0_1 = L2_1.utf8p1
                                                      L1_1 = 100
                                                    else
                                                      L2_1 = this_sigattrlog
                                                      L2_1 = L2_1[32]
                                                      L2_1 = L2_1.matched
                                                      if L2_1 then
                                                        L2_1 = this_sigattrlog
                                                        L2_1 = L2_1[32]
                                                        L0_1 = L2_1.utf8p1
                                                        L1_1 = 101
                                                      else
                                                        L2_1 = this_sigattrlog
                                                        L2_1 = L2_1[33]
                                                        L2_1 = L2_1.matched
                                                        if L2_1 then
                                                          L2_1 = this_sigattrlog
                                                          L2_1 = L2_1[33]
                                                          L0_1 = L2_1.utf8p1
                                                          L1_1 = 102
                                                        else
                                                          L2_1 = this_sigattrlog
                                                          L2_1 = L2_1[34]
                                                          L2_1 = L2_1.matched
                                                          if L2_1 then
                                                            L2_1 = this_sigattrlog
                                                            L2_1 = L2_1[34]
                                                            L0_1 = L2_1.utf8p1
                                                            L1_1 = 103
                                                          else
                                                            L2_1 = this_sigattrlog
                                                            L2_1 = L2_1[35]
                                                            L2_1 = L2_1.matched
                                                            if L2_1 then
                                                              L2_1 = this_sigattrlog
                                                              L2_1 = L2_1[35]
                                                              L0_1 = L2_1.utf8p1
                                                              L1_1 = 104
                                                            else
                                                              L2_1 = this_sigattrlog
                                                              L2_1 = L2_1[36]
                                                              L2_1 = L2_1.matched
                                                              if L2_1 then
                                                                L2_1 = this_sigattrlog
                                                                L2_1 = L2_1[36]
                                                                L0_1 = L2_1.utf8p1
                                                                L1_1 = 105
                                                              else
                                                                L2_1 = this_sigattrlog
                                                                L2_1 = L2_1[37]
                                                                L2_1 = L2_1.matched
                                                                if L2_1 then
                                                                  L2_1 = this_sigattrlog
                                                                  L2_1 = L2_1[37]
                                                                  L0_1 = L2_1.utf8p1
                                                                  L1_1 = 106
                                                                else
                                                                  L2_1 = this_sigattrlog
                                                                  L2_1 = L2_1[38]
                                                                  L2_1 = L2_1.matched
                                                                  if L2_1 then
                                                                    L2_1 = this_sigattrlog
                                                                    L2_1 = L2_1[38]
                                                                    L0_1 = L2_1.utf8p1
                                                                    L1_1 = 107
                                                                  else
                                                                    L2_1 = this_sigattrlog
                                                                    L2_1 = L2_1[39]
                                                                    L2_1 = L2_1.matched
                                                                    if L2_1 then
                                                                      L2_1 = this_sigattrlog
                                                                      L2_1 = L2_1[39]
                                                                      L0_1 = L2_1.utf8p1
                                                                      L1_1 = 108
                                                                    else
                                                                      L2_1 = this_sigattrlog
                                                                      L2_1 = L2_1[40]
                                                                      L2_1 = L2_1.matched
                                                                      if L2_1 then
                                                                        L2_1 = this_sigattrlog
                                                                        L2_1 = L2_1[40]
                                                                        L0_1 = L2_1.utf8p1
                                                                        L1_1 = 109
                                                                      else
                                                                        L2_1 = this_sigattrlog
                                                                        L2_1 = L2_1[41]
                                                                        L2_1 = L2_1.matched
                                                                        if L2_1 then
                                                                          L2_1 = this_sigattrlog
                                                                          L2_1 = L2_1[41]
                                                                          L0_1 = L2_1.utf8p1
                                                                          L1_1 = 253
                                                                        else
                                                                          L2_1 = this_sigattrlog
                                                                          L2_1 = L2_1[42]
                                                                          L2_1 = L2_1.matched
                                                                          if L2_1 then
                                                                            L2_1 = this_sigattrlog
                                                                            L2_1 = L2_1[42]
                                                                            L0_1 = L2_1.utf8p1
                                                                            L1_1 = 254
                                                                          else
                                                                            L2_1 = this_sigattrlog
                                                                            L2_1 = L2_1[43]
                                                                            L2_1 = L2_1.matched
                                                                            if L2_1 then
                                                                              L2_1 = this_sigattrlog
                                                                              L2_1 = L2_1[43]
                                                                              L0_1 = L2_1.utf8p1
                                                                              L1_1 = 259
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
    end
  end
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
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1
L5_1 = "_"
L6_1 = L1_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L0_1
L5_1 = L5_1(L6_1)
L0_1 = L5_1
if not L0_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CheckUrl
L6_1 = L0_1
L5_1, L6_1 = L5_1(L6_1)
if L5_1 == 1 and L6_1 == 1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = MpCommon
L7_1 = L7_1.QueryPersistContextNoPath
L8_1 = "deprecatedDnsRecordType"
L9_1 = L4_1
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L8_1 = MpCommon
  L8_1 = L8_1.AppendPersistContextNoPath
  L9_1 = "deprecatedDnsRecordType"
  L10_1 = L4_1
  L11_1 = 3600
  L8_1(L9_1, L10_1, L11_1)
end
L8_1 = MpCommon
L8_1 = L8_1.GetPersistContextCountNoPath
L9_1 = "deprecatedDnsRecordType"
L8_1 = L8_1(L9_1)
if 5 < L8_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
