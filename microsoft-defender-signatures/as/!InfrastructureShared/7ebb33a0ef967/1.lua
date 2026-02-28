local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = ""
L1_1 = 30
L2_1 = "DataStager"
L3_1 = {}
L4_1 = 60
L5_1 = 100
L6_1 = "|"
L7_1 = this_sigattrlog
L7_1 = L7_1[22]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L0_1 = L7_1[22]
else
  L7_1 = this_sigattrlog
  L7_1 = L7_1[23]
  L7_1 = L7_1.matched
  if L7_1 then
    L7_1 = this_sigattrlog
    L0_1 = L7_1[23]
  else
    L7_1 = this_sigattrlog
    L7_1 = L7_1[24]
    L7_1 = L7_1.matched
    if L7_1 then
      L7_1 = this_sigattrlog
      L0_1 = L7_1[24]
    else
      L7_1 = this_sigattrlog
      L7_1 = L7_1[25]
      L7_1 = L7_1.matched
      if L7_1 then
        L7_1 = this_sigattrlog
        L0_1 = L7_1[25]
      else
        L7_1 = this_sigattrlog
        L7_1 = L7_1[26]
        L7_1 = L7_1.matched
        if L7_1 then
          L7_1 = this_sigattrlog
          L0_1 = L7_1[26]
        else
          L7_1 = this_sigattrlog
          L7_1 = L7_1[27]
          L7_1 = L7_1.matched
          if L7_1 then
            L7_1 = this_sigattrlog
            L0_1 = L7_1[27]
          else
            L7_1 = this_sigattrlog
            L7_1 = L7_1[28]
            L7_1 = L7_1.matched
            if L7_1 then
              L7_1 = this_sigattrlog
              L0_1 = L7_1[28]
            else
              L7_1 = this_sigattrlog
              L7_1 = L7_1[29]
              L7_1 = L7_1.matched
              if L7_1 then
                L7_1 = this_sigattrlog
                L0_1 = L7_1[29]
              else
                L7_1 = this_sigattrlog
                L7_1 = L7_1[30]
                L7_1 = L7_1.matched
                if L7_1 then
                  L7_1 = this_sigattrlog
                  L0_1 = L7_1[30]
                else
                  L7_1 = this_sigattrlog
                  L7_1 = L7_1[31]
                  L7_1 = L7_1.matched
                  if L7_1 then
                    L7_1 = this_sigattrlog
                    L0_1 = L7_1[31]
                  else
                    L7_1 = this_sigattrlog
                    L7_1 = L7_1[32]
                    L7_1 = L7_1.matched
                    if L7_1 then
                      L7_1 = this_sigattrlog
                      L0_1 = L7_1[32]
                    else
                      L7_1 = this_sigattrlog
                      L7_1 = L7_1[33]
                      L7_1 = L7_1.matched
                      if L7_1 then
                        L7_1 = this_sigattrlog
                        L0_1 = L7_1[33]
                      else
                        L7_1 = this_sigattrlog
                        L7_1 = L7_1[34]
                        L7_1 = L7_1.matched
                        if L7_1 then
                          L7_1 = this_sigattrlog
                          L0_1 = L7_1[34]
                        else
                          L7_1 = this_sigattrlog
                          L7_1 = L7_1[35]
                          L7_1 = L7_1.matched
                          if L7_1 then
                            L7_1 = this_sigattrlog
                            L0_1 = L7_1[35]
                          else
                            L7_1 = this_sigattrlog
                            L7_1 = L7_1[36]
                            L7_1 = L7_1.matched
                            if L7_1 then
                              L7_1 = this_sigattrlog
                              L0_1 = L7_1[36]
                            else
                              L7_1 = this_sigattrlog
                              L7_1 = L7_1[37]
                              L7_1 = L7_1.matched
                              if L7_1 then
                                L7_1 = this_sigattrlog
                                L0_1 = L7_1[37]
                              else
                                L7_1 = this_sigattrlog
                                L7_1 = L7_1[38]
                                L7_1 = L7_1.matched
                                if L7_1 then
                                  L7_1 = this_sigattrlog
                                  L0_1 = L7_1[38]
                                else
                                  L7_1 = this_sigattrlog
                                  L7_1 = L7_1[39]
                                  L7_1 = L7_1.matched
                                  if L7_1 then
                                    L7_1 = this_sigattrlog
                                    L0_1 = L7_1[39]
                                  else
                                    L7_1 = this_sigattrlog
                                    L7_1 = L7_1[40]
                                    L7_1 = L7_1.matched
                                    if L7_1 then
                                      L7_1 = this_sigattrlog
                                      L0_1 = L7_1[40]
                                    else
                                      L7_1 = mp
                                      L7_1 = L7_1.CLEAN
                                      return L7_1
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

function L7_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "(.*[/\\])"
  return L1_2(L2_2, L3_2)
end

L8_1 = L0_1.utf8p1
L9_1 = L0_1.utf8p2
L10_1 = L7_1
L11_1 = L8_1
L10_1 = L10_1(L11_1)
L11_1 = L7_1
L12_1 = L9_1
L11_1 = L11_1(L12_1)
if L10_1 == L11_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = bm
L10_1 = L10_1.get_current_process_startup_info
L10_1 = L10_1()
L11_1 = MpCommon
L11_1 = L11_1.PathToWin32Path
L12_1 = bm
L12_1 = L12_1.get_imagepath
L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L12_1()
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
L12_1 = L10_1.ppid
L13_1 = L6_1
L14_1 = L11_1
L15_1 = L6_1
L16_1 = L7_1
L17_1 = L9_1
L16_1 = L16_1(L17_1)
L12_1 = L12_1 .. L13_1 .. L14_1 .. L15_1 .. L16_1
L13_1 = GetRollingQueueKeyValues
L14_1 = L2_1
L15_1 = L12_1
L13_1 = L13_1(L14_1, L15_1)
if L13_1 then
  L14_1 = ipairs
  L15_1 = L13_1
  L14_1, L15_1, L16_1 = L14_1(L15_1)
  for L17_1, L18_1 in L14_1, L15_1, L16_1 do
    if L18_1 then
      L19_1 = L18_1.value
      if L19_1 == L9_1 then
        L19_1 = mp
        L19_1 = L19_1.CLEAN
        return L19_1
      end
    end
  end
  L14_1 = #L13_1
  if L1_1 < L14_1 then
    L14_1 = GetRollingQueueKeys
    L15_1 = L2_1
    L14_1 = L14_1(L15_1)
    L3_1.DataStagerRQName = L14_1
    L14_1 = GetRollingQueueCount
    L15_1 = L2_1
    L14_1 = L14_1(L15_1)
    L3_1.DataStagerCount = L14_1
    L14_1 = MpCommon
    L14_1 = L14_1.JsonSerialize
    L15_1 = L3_1
    L14_1 = L14_1(L15_1)
    L3_1 = L14_1
    L14_1 = bm
    L14_1 = L14_1.add_related_string
    L15_1 = "DataStagerInfo"
    L16_1 = L3_1
    L17_1 = bm
    L17_1 = L17_1.RelatedStringBMReport
    L14_1(L15_1, L16_1, L17_1)
    L14_1 = reportSessionInformation
    L14_1()
    L14_1 = reportTimingData
    L14_1()
    L14_1 = mp
    L14_1 = L14_1.INFECTED
    return L14_1
  end
end
L14_1 = AppendToRollingQueue
L15_1 = L2_1
L16_1 = L12_1
L17_1 = L9_1
L18_1 = L4_1
L19_1 = L5_1
L20_1 = 0
L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
L14_1 = mp
L14_1 = L14_1.CLEAN
return L14_1
