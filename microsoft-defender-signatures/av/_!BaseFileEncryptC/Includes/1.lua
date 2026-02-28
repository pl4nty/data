local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = versioning
L1_1 = L1_1.GetOrgID
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = type
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 == "string" then
    goto lbl_44
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_44::
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
if L2_1 ~= "sbsimulator.exe" then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "sbsimulator"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "sbsimulation"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L3_1 = L3_1(L4_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILENAME
L4_1 = L4_1(L5_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = string
L5_1 = L5_1.match
L6_1 = L4_1
L7_1 = "(%.[^%.]+)$"
L5_1 = L5_1(L6_1, L7_1)
L6_1 = IsBasFileEncryptExt
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 == false then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L4_1
  L8_1 = "sb_%d+_bs_%d+%.[^%.]+$"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = MpCommon
  L6_1 = L6_1.PathToWin32Path
  L7_1 = L3_1
  L6_1 = L6_1(L7_1)
  if L6_1 ~= nil and L6_1 ~= "" then
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    L6_1 = L7_1
  end
  L7_1 = MpCommon
  L7_1 = L7_1.ExpandEnvironmentVariables
  L8_1 = L3_1
  L7_1 = L7_1(L8_1)
  L8_1 = MpCommon
  L8_1 = L8_1.PathToWin32Path
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  L7_1 = L8_1
  if L7_1 ~= nil and L7_1 ~= "" then
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    L7_1 = L8_1
  end
  L8_1 = mp
  L8_1 = L8_1.ContextualExpandEnvironmentVariables
  L9_1 = L3_1
  L8_1 = L8_1(L9_1)
  L9_1 = MpCommon
  L9_1 = L9_1.PathToWin32Path
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
  if L8_1 ~= nil and L8_1 ~= "" then
    L9_1 = string
    L9_1 = L9_1.lower
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    L8_1 = L9_1
  end
  L9_1 = string
  L9_1 = L9_1.lower
  L10_1 = MpCommon
  L10_1 = L10_1.ExpandEnvironmentVariables
  L11_1 = "%systemroot%"
  L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1(L11_1)
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
  L10_1 = string
  L10_1 = L10_1.lower
  L11_1 = mp
  L11_1 = L11_1.ContextualExpandEnvironmentVariables
  L12_1 = "%temp%"
  L11_1, L12_1, L13_1, L14_1 = L11_1(L12_1)
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  L11_1 = string
  L11_1 = L11_1.find
  L12_1 = L3_1
  L13_1 = "[a-z]:\\windows\\temp\\sb%-sim%-temp"
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 == nil then
    L11_1 = string
    L11_1 = L11_1.find
    L12_1 = L3_1
    L13_1 = L9_1
    L14_1 = "\\temp\\sb%-sim%-temp"
    L13_1 = L13_1 .. L14_1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 == nil then
      L11_1 = string
      L11_1 = L11_1.find
      L12_1 = L3_1
      L13_1 = "[a-z]:\\users\\[^\\]+\\appdata\\local\\temp\\sb_%d+_bs_"
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 == nil then
        L11_1 = string
        L11_1 = L11_1.find
        L12_1 = L3_1
        L13_1 = L10_1
        L14_1 = "\\sb_%d+_bs_"
        L13_1 = L13_1 .. L14_1
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 == nil and L6_1 ~= nil then
          L11_1 = string
          L11_1 = L11_1.find
          L12_1 = L6_1
          L13_1 = "[a-z]:\\windows\\temp\\sb%-sim%-temp"
          L11_1 = L11_1(L12_1, L13_1)
          if L11_1 == nil and L6_1 ~= nil then
            L11_1 = string
            L11_1 = L11_1.find
            L12_1 = L6_1
            L13_1 = L9_1
            L14_1 = "\\temp\\sb%-sim%-temp"
            L13_1 = L13_1 .. L14_1
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 == nil and L6_1 ~= nil then
              L11_1 = string
              L11_1 = L11_1.find
              L12_1 = L6_1
              L13_1 = "[a-z]:\\users\\[^\\]+\\appdata\\local\\temp\\sb_%d+_bs_"
              L11_1 = L11_1(L12_1, L13_1)
              if L11_1 == nil and L6_1 ~= nil then
                L11_1 = string
                L11_1 = L11_1.find
                L12_1 = L6_1
                L13_1 = L10_1
                L14_1 = "\\sb_%d+_bs_"
                L13_1 = L13_1 .. L14_1
                L11_1 = L11_1(L12_1, L13_1)
                if L11_1 == nil and L7_1 ~= nil then
                  L11_1 = string
                  L11_1 = L11_1.find
                  L12_1 = L7_1
                  L13_1 = "[a-z]:\\windows\\temp\\sb%-sim%-temp"
                  L11_1 = L11_1(L12_1, L13_1)
                  if L11_1 == nil and L7_1 ~= nil then
                    L11_1 = string
                    L11_1 = L11_1.find
                    L12_1 = L7_1
                    L13_1 = L9_1
                    L14_1 = "\\temp\\sb%-sim%-temp"
                    L13_1 = L13_1 .. L14_1
                    L11_1 = L11_1(L12_1, L13_1)
                    if L11_1 == nil and L7_1 ~= nil then
                      L11_1 = string
                      L11_1 = L11_1.find
                      L12_1 = L7_1
                      L13_1 = "[a-z]:\\users\\[^\\]+\\appdata\\local\\temp\\sb_%d+_bs_"
                      L11_1 = L11_1(L12_1, L13_1)
                      if L11_1 == nil and L7_1 ~= nil then
                        L11_1 = string
                        L11_1 = L11_1.find
                        L12_1 = L7_1
                        L13_1 = L10_1
                        L14_1 = "\\sb_%d+_bs_"
                        L13_1 = L13_1 .. L14_1
                        L11_1 = L11_1(L12_1, L13_1)
                        if L11_1 == nil and L8_1 ~= nil then
                          L11_1 = string
                          L11_1 = L11_1.find
                          L12_1 = L8_1
                          L13_1 = "[a-z]:\\windows\\temp\\sb%-sim%-temp"
                          L11_1 = L11_1(L12_1, L13_1)
                          if L11_1 == nil and L8_1 ~= nil then
                            L11_1 = string
                            L11_1 = L11_1.find
                            L12_1 = L8_1
                            L13_1 = L9_1
                            L14_1 = "\\temp\\sb%-sim%-temp"
                            L13_1 = L13_1 .. L14_1
                            L11_1 = L11_1(L12_1, L13_1)
                            if L11_1 == nil and L8_1 ~= nil then
                              L11_1 = string
                              L11_1 = L11_1.find
                              L12_1 = L8_1
                              L13_1 = "[a-z]:\\users\\[^\\]+\\appdata\\local\\temp\\sb_%d+_bs_"
                              L11_1 = L11_1(L12_1, L13_1)
                              if L11_1 == nil and L8_1 ~= nil then
                                L11_1 = string
                                L11_1 = L11_1.find
                                L12_1 = L8_1
                                L13_1 = L10_1
                                L14_1 = "\\sb_%d+_bs_"
                                L13_1 = L13_1 .. L14_1
                                L11_1 = L11_1(L12_1, L13_1)
                                if L11_1 == nil then
                                  L11_1 = mp
                                  L11_1 = L11_1.set_mpattribute
                                  L12_1 = "MpDisableMOACSyncInsert"
                                  L11_1(L12_1)
                                  L11_1 = mp
                                  L11_1 = L11_1.set_mpattribute
                                  L12_1 = "MpDisableCaching"
                                  L11_1(L12_1)
                                  L11_1 = mp
                                  L11_1 = L11_1.CLEAN
                                  return L11_1
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
L6_1 = MpCommon
L6_1 = L6_1.BmTriggerSigPropagate
L7_1 = mp
L7_1 = L7_1.get_contextdata
L8_1 = mp
L8_1 = L8_1.CONTEXT_DATA_PROCESS_PPID
L7_1 = L7_1(L8_1)
L8_1 = "BAS_BaseFileEncryptProc"
L9_1 = L3_1
L6_1(L7_1, L8_1, L9_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
