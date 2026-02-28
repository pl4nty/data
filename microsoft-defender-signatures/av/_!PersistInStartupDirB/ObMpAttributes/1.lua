local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = type
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 == "string" then
    goto lbl_14
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_14::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and L0_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and L0_1 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
  L1_1 = MpCommon
  L1_1 = L1_1.IsSampled
  L2_1 = 25000
  L3_1 = false
  L4_1 = false
  L5_1 = false
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 ~= true then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= "python.exe" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\attackiq\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "\\ai_cleanup"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "\\attack_graph"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
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
if L5_1 ~= ".exe" then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.getfilename
L7_1 = mp
L7_1 = L7_1.FILEPATH_QUERY_FULL
L6_1 = L6_1(L7_1)
if L6_1 == nil or L6_1 == "" then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L6_1 = L7_1
L7_1 = string
L7_1 = L7_1.find
L8_1 = L6_1
L9_1 = "\\attackiq"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = MpCommon
L7_1 = L7_1.PathToWin32Path
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 ~= nil and L7_1 ~= "" then
  L8_1 = string
  L8_1 = L8_1.lower
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  L7_1 = L8_1
end
L8_1 = MpCommon
L8_1 = L8_1.ExpandEnvironmentVariables
L9_1 = L6_1
L8_1 = L8_1(L9_1)
if L8_1 ~= nil and L8_1 ~= "" then
  L9_1 = MpCommon
  L9_1 = L9_1.PathToWin32Path
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
end
if L8_1 ~= nil and L8_1 ~= "" then
  L9_1 = string
  L9_1 = L9_1.lower
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
end
L9_1 = mp
L9_1 = L9_1.ContextualExpandEnvironmentVariables
L10_1 = L6_1
L9_1 = L9_1(L10_1)
if L9_1 ~= nil and L9_1 ~= "" then
  L10_1 = MpCommon
  L10_1 = L10_1.PathToWin32Path
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  L9_1 = L10_1
end
if L9_1 ~= nil and L9_1 ~= "" then
  L10_1 = string
  L10_1 = L10_1.lower
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  L9_1 = L10_1
end
L10_1 = string
L10_1 = L10_1.lower
L11_1 = MpCommon
L11_1 = L11_1.ExpandEnvironmentVariables
L12_1 = "%systemroot%"
L11_1, L12_1, L13_1, L14_1, L15_1 = L11_1(L12_1)
L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1)
L11_1 = string
L11_1 = L11_1.lower
L12_1 = MpCommon
L12_1 = L12_1.ExpandEnvironmentVariables
L13_1 = "%programdata%"
L12_1, L13_1, L14_1, L15_1 = L12_1(L13_1)
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
L12_1 = string
L12_1 = L12_1.find
L13_1 = L6_1
L14_1 = "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
L12_1 = L12_1(L13_1, L14_1)
if L12_1 == nil then
  L12_1 = string
  L12_1 = L12_1.find
  L13_1 = L6_1
  L14_1 = L10_1
  L15_1 = "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
  L14_1 = L14_1 .. L15_1
  L12_1 = L12_1(L13_1, L14_1)
  if L12_1 == nil then
    L12_1 = string
    L12_1 = L12_1.find
    L13_1 = L6_1
    L14_1 = "[a-z]:\\programdata\\start menu\\programs\\startup"
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 == nil then
      L12_1 = string
      L12_1 = L12_1.find
      L13_1 = L6_1
      L14_1 = L11_1
      L15_1 = "\\start menu\\programs\\startup"
      L14_1 = L14_1 .. L15_1
      L12_1 = L12_1(L13_1, L14_1)
      if L12_1 == nil then
        L12_1 = string
        L12_1 = L12_1.find
        L13_1 = L6_1
        L14_1 = "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup"
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 == nil then
          L12_1 = string
          L12_1 = L12_1.find
          L13_1 = L6_1
          L14_1 = L11_1
          L15_1 = "\\microsoft\\windows\\start menu\\programs\\startup"
          L14_1 = L14_1 .. L15_1
          L12_1 = L12_1(L13_1, L14_1)
          if L12_1 == nil then
            if L7_1 ~= nil then
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L7_1
              L14_1 = "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L7_1
              L14_1 = L10_1
              L15_1 = "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L14_1 = L14_1 .. L15_1
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L7_1
              L14_1 = "[a-z]:\\programdata\\start menu\\programs\\startup"
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L7_1
              L14_1 = L11_1
              L15_1 = "\\start menu\\programs\\startup"
              L14_1 = L14_1 .. L15_1
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L7_1
              L14_1 = "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L7_1
              L14_1 = L11_1
              L15_1 = "\\microsoft\\windows\\start menu\\programs\\startup"
              L14_1 = L14_1 .. L15_1
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
            end
            if L8_1 ~= nil then
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L8_1
              L14_1 = "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L8_1
              L14_1 = L10_1
              L15_1 = "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L14_1 = L14_1 .. L15_1
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L8_1
              L14_1 = "[a-z]:\\programdata\\start menu\\programs\\startup"
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L8_1
              L14_1 = L11_1
              L15_1 = "\\start menu\\programs\\startup"
              L14_1 = L14_1 .. L15_1
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L8_1
              L14_1 = "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L8_1
              L14_1 = L11_1
              L15_1 = "\\microsoft\\windows\\start menu\\programs\\startup"
              L14_1 = L14_1 .. L15_1
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
            end
            if L9_1 ~= nil then
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L9_1
              L14_1 = "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L9_1
              L14_1 = L10_1
              L15_1 = "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L14_1 = L14_1 .. L15_1
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L9_1
              L14_1 = "[a-z]:\\programdata\\start menu\\programs\\startup"
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L9_1
              L14_1 = L11_1
              L15_1 = "\\start menu\\programs\\startup"
              L14_1 = L14_1 .. L15_1
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L9_1
              L14_1 = "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
              L12_1 = string
              L12_1 = L12_1.find
              L13_1 = L9_1
              L14_1 = L11_1
              L15_1 = "\\microsoft\\windows\\start menu\\programs\\startup"
              L14_1 = L14_1 .. L15_1
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 ~= nil then
                goto lbl_443
              end
            end
            L12_1 = mp
            L12_1 = L12_1.CLEAN
            return L12_1
          end
        end
      end
    end
  end
end
::lbl_443::
L12_1 = MpCommon
L12_1 = L12_1.BmTriggerSig
L13_1 = mp
L13_1 = L13_1.get_contextdata
L14_1 = mp
L14_1 = L14_1.CONTEXT_DATA_PROCESS_PPID
L13_1 = L13_1(L14_1)
L14_1 = "BAS_PersistInStartupDir"
L15_1 = L6_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = mp
L12_1 = L12_1.INFECTED
return L12_1
