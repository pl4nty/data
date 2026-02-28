local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = ""
L1_1 = 30
L2_1 = "DataStagerB"
L3_1 = {}
L4_1 = 3600
L5_1 = 100
L6_1 = "|"
L7_1 = this_sigattrlog
L7_1 = L7_1[6]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L0_1 = L7_1[6]
else
  L7_1 = this_sigattrlog
  L7_1 = L7_1[7]
  L7_1 = L7_1.matched
  if L7_1 then
    L7_1 = this_sigattrlog
    L0_1 = L7_1[7]
  else
    L7_1 = this_sigattrlog
    L7_1 = L7_1[8]
    L7_1 = L7_1.matched
    if L7_1 then
      L7_1 = this_sigattrlog
      L0_1 = L7_1[8]
    else
      L7_1 = this_sigattrlog
      L7_1 = L7_1[9]
      L7_1 = L7_1.matched
      if L7_1 then
        L7_1 = this_sigattrlog
        L0_1 = L7_1[9]
      else
        L7_1 = this_sigattrlog
        L7_1 = L7_1[10]
        L7_1 = L7_1.matched
        if L7_1 then
          L7_1 = this_sigattrlog
          L0_1 = L7_1[10]
        else
          L7_1 = this_sigattrlog
          L7_1 = L7_1[11]
          L7_1 = L7_1.matched
          if L7_1 then
            L7_1 = this_sigattrlog
            L0_1 = L7_1[11]
          else
            L7_1 = this_sigattrlog
            L7_1 = L7_1[12]
            L7_1 = L7_1.matched
            if L7_1 then
              L7_1 = this_sigattrlog
              L0_1 = L7_1[12]
            else
              L7_1 = this_sigattrlog
              L7_1 = L7_1[13]
              L7_1 = L7_1.matched
              if L7_1 then
                L7_1 = this_sigattrlog
                L0_1 = L7_1[13]
              else
                L7_1 = this_sigattrlog
                L7_1 = L7_1[14]
                L7_1 = L7_1.matched
                if L7_1 then
                  L7_1 = this_sigattrlog
                  L0_1 = L7_1[14]
                else
                  L7_1 = this_sigattrlog
                  L7_1 = L7_1[15]
                  L7_1 = L7_1.matched
                  if L7_1 then
                    L7_1 = this_sigattrlog
                    L0_1 = L7_1[15]
                  else
                    L7_1 = this_sigattrlog
                    L7_1 = L7_1[16]
                    L7_1 = L7_1.matched
                    if L7_1 then
                      L7_1 = this_sigattrlog
                      L0_1 = L7_1[16]
                    else
                      L7_1 = this_sigattrlog
                      L7_1 = L7_1[17]
                      L7_1 = L7_1.matched
                      if L7_1 then
                        L7_1 = this_sigattrlog
                        L0_1 = L7_1[17]
                      else
                        L7_1 = this_sigattrlog
                        L7_1 = L7_1[18]
                        L7_1 = L7_1.matched
                        if L7_1 then
                          L7_1 = this_sigattrlog
                          L0_1 = L7_1[18]
                        else
                          L7_1 = this_sigattrlog
                          L7_1 = L7_1[19]
                          L7_1 = L7_1.matched
                          if L7_1 then
                            L7_1 = this_sigattrlog
                            L0_1 = L7_1[19]
                          else
                            L7_1 = this_sigattrlog
                            L7_1 = L7_1[20]
                            L7_1 = L7_1.matched
                            if L7_1 then
                              L7_1 = this_sigattrlog
                              L0_1 = L7_1[20]
                            else
                              L7_1 = this_sigattrlog
                              L7_1 = L7_1[21]
                              L7_1 = L7_1.matched
                              if L7_1 then
                                L7_1 = this_sigattrlog
                                L0_1 = L7_1[21]
                              else
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
L7_1 = L0_1.utf8p1
L8_1 = StringStartsWith
L9_1 = L7_1
L10_1 = "%"
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = bm
L8_1 = L8_1.get_current_process_startup_info
L8_1 = L8_1()
L9_1 = MpCommon
L9_1 = L9_1.PathToWin32Path
L10_1 = bm
L10_1 = L10_1.get_imagepath
L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L10_1()
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
L10_1 = L8_1.ppid
L11_1 = L6_1
L12_1 = L9_1
L10_1 = L10_1 .. L11_1 .. L12_1
L11_1 = GetRollingQueueKeyValues
L12_1 = L2_1
L13_1 = L10_1
L11_1 = L11_1(L12_1, L13_1)
if L11_1 then
  L12_1 = ipairs
  L13_1 = L11_1
  L12_1, L13_1, L14_1 = L12_1(L13_1)
  for L15_1, L16_1 in L12_1, L13_1, L14_1 do
    if L16_1 then
      L17_1 = L16_1.value
      if L17_1 then
        L17_1 = L16_1.value
        if L17_1 == L7_1 then
          L17_1 = mp
          L17_1 = L17_1.CLEAN
          return L17_1
        end
        L17_1 = string
        L17_1 = L17_1.match
        L18_1 = L16_1.value
        L19_1 = "(%.[^%.]+)$"
        L17_1 = L17_1(L18_1, L19_1)
        L18_1 = string
        L18_1 = L18_1.match
        L19_1 = L7_1
        L20_1 = "(%.[^%.]+)$"
        L18_1 = L18_1(L19_1, L20_1)
        if L17_1 == L18_1 then
          L19_1 = AddToAtomicCounter
          L20_1 = L2_1
          L21_1 = 1
          L19_1 = L19_1(L20_1, L21_1)
          if 4 < L19_1 then
            L20_1 = mp
            L20_1 = L20_1.CLEAN
            return L20_1
          end
        end
      end
    end
  end
  L12_1 = #L11_1
  if L1_1 < L12_1 then
    L3_1.DataStagerRQName = L11_1
    L12_1 = GetRollingQueueCount
    L13_1 = L2_1
    L12_1 = L12_1(L13_1)
    L3_1.DataStagerCount = L12_1
    L12_1 = bm
    L12_1 = L12_1.add_related_string
    L13_1 = "DataStagerInfo"
    L14_1 = MpCommon
    L14_1 = L14_1.JsonSerialize
    L15_1 = L3_1
    L14_1 = L14_1(L15_1)
    L15_1 = bm
    L15_1 = L15_1.RelatedStringBMReport
    L12_1(L13_1, L14_1, L15_1)
    L12_1 = reportSessionInformation
    L12_1()
    L12_1 = reportTimingData
    L12_1()
    L12_1 = mp
    L12_1 = L12_1.INFECTED
    return L12_1
  end
end
L12_1 = AppendToRollingQueue
L13_1 = L2_1
L14_1 = L10_1
L15_1 = L7_1
L16_1 = L4_1
L17_1 = L5_1
L18_1 = 0
L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
