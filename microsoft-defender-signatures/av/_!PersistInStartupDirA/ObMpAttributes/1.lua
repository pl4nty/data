local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
  L2_1 = 15000
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
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "(%.[^%.]+)$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= ".exe" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.getfilename
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FULL
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
if L4_1 ~= nil then
  if L4_1 == nil then
    goto lbl_117
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "startup"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    goto lbl_117
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_117::
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 ~= nil and L5_1 ~= "" then
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
end
L6_1 = MpCommon
L6_1 = L6_1.ExpandEnvironmentVariables
L7_1 = L4_1
L6_1 = L6_1(L7_1)
if L6_1 ~= nil and L6_1 ~= "" then
  L7_1 = MpCommon
  L7_1 = L7_1.PathToWin32Path
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L6_1 = L7_1
end
if L6_1 ~= nil and L6_1 ~= "" then
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L6_1 = L7_1
end
L7_1 = mp
L7_1 = L7_1.ContextualExpandEnvironmentVariables
L8_1 = L4_1
L7_1 = L7_1(L8_1)
if L7_1 ~= nil and L7_1 ~= "" then
  L8_1 = MpCommon
  L8_1 = L8_1.PathToWin32Path
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  L7_1 = L8_1
end
if L7_1 ~= nil and L7_1 ~= "" then
  L8_1 = string
  L8_1 = L8_1.lower
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  L7_1 = L8_1
end
L8_1 = string
L8_1 = L8_1.lower
L9_1 = MpCommon
L9_1 = L9_1.ExpandEnvironmentVariables
L10_1 = "%systemroot%"
L9_1, L10_1, L11_1, L12_1, L13_1 = L9_1(L10_1)
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
L9_1 = string
L9_1 = L9_1.lower
L10_1 = MpCommon
L10_1 = L10_1.ExpandEnvironmentVariables
L11_1 = "%programdata%"
L10_1, L11_1, L12_1, L13_1 = L10_1(L11_1)
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
L10_1 = string
L10_1 = L10_1.find
L11_1 = L4_1
L12_1 = "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
L10_1 = L10_1(L11_1, L12_1)
if L10_1 == nil then
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L4_1
  L12_1 = L8_1
  L13_1 = "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
  L12_1 = L12_1 .. L13_1
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 == nil then
    L10_1 = string
    L10_1 = L10_1.find
    L11_1 = L4_1
    L12_1 = "[a-z]:\\programdata\\start menu\\programs\\startup"
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 == nil then
      L10_1 = string
      L10_1 = L10_1.find
      L11_1 = L4_1
      L12_1 = L9_1
      L13_1 = "\\start menu\\programs\\startup"
      L12_1 = L12_1 .. L13_1
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 == nil then
        L10_1 = string
        L10_1 = L10_1.find
        L11_1 = L4_1
        L12_1 = "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup"
        L10_1 = L10_1(L11_1, L12_1)
        if L10_1 == nil then
          L10_1 = string
          L10_1 = L10_1.find
          L11_1 = L4_1
          L12_1 = L9_1
          L13_1 = "\\microsoft\\windows\\start menu\\programs\\startup"
          L12_1 = L12_1 .. L13_1
          L10_1 = L10_1(L11_1, L12_1)
          if L10_1 == nil then
            if L5_1 ~= nil then
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L5_1
              L12_1 = "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L5_1
              L12_1 = L8_1
              L13_1 = "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1 .. L13_1
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L5_1
              L12_1 = "[a-z]:\\programdata\\start menu\\programs\\startup"
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L5_1
              L12_1 = L9_1
              L13_1 = "\\start menu\\programs\\startup"
              L12_1 = L12_1 .. L13_1
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L5_1
              L12_1 = "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup"
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L5_1
              L12_1 = L9_1
              L13_1 = "\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1 .. L13_1
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
            end
            if L6_1 ~= nil then
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L6_1
              L12_1 = "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L6_1
              L12_1 = L8_1
              L13_1 = "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1 .. L13_1
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L6_1
              L12_1 = "[a-z]:\\programdata\\start menu\\programs\\startup"
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L6_1
              L12_1 = L9_1
              L13_1 = "\\start menu\\programs\\startup"
              L12_1 = L12_1 .. L13_1
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L6_1
              L12_1 = "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup"
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L6_1
              L12_1 = L9_1
              L13_1 = "\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1 .. L13_1
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
            end
            if L7_1 ~= nil then
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L7_1
              L12_1 = "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L7_1
              L12_1 = L8_1
              L13_1 = "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1 .. L13_1
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L7_1
              L12_1 = "[a-z]:\\programdata\\start menu\\programs\\startup"
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L7_1
              L12_1 = L9_1
              L13_1 = "\\start menu\\programs\\startup"
              L12_1 = L12_1 .. L13_1
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L7_1
              L12_1 = "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup"
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L7_1
              L12_1 = L9_1
              L13_1 = "\\microsoft\\windows\\start menu\\programs\\startup"
              L12_1 = L12_1 .. L13_1
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= nil then
                goto lbl_389
              end
            end
            L10_1 = mp
            L10_1 = L10_1.CLEAN
            return L10_1
          end
        end
      end
    end
  end
end
::lbl_389::
L10_1 = MpCommon
L10_1 = L10_1.BmTriggerSig
L11_1 = mp
L11_1 = L11_1.get_contextdata
L12_1 = mp
L12_1 = L12_1.CONTEXT_DATA_PROCESS_PPID
L11_1 = L11_1(L12_1)
L12_1 = "BAS_PersistInStartupDirTel"
L13_1 = L4_1
L10_1(L11_1, L12_1, L13_1)
L10_1 = mp
L10_1 = L10_1.INFECTED
return L10_1
