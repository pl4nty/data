local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "3b576869-a4ec-4529-8536-b80a7769e899"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = GetCtxOfficeProc
L0_1 = L0_1()
if L0_1 ~= "productivity" then
  L0_1 = MpCommon
  L0_1 = L0_1.GetPersistContextCountNoPath
  L1_1 = "BlockOfficeCreateExecContentProcs"
  L0_1 = L0_1(L1_1)
  if L0_1 == 0 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_PROCESS_PPID
  L0_1 = L0_1(L1_1)
  if L0_1 == "" or L0_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
  L1_1 = L1_1(L2_1)
  if L1_1 == "" or L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = L1_1
  L3_1 = "+"
  L4_1 = L0_1
  L2_1 = L2_1 .. L3_1 .. L4_1
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContextNoPath
  L4_1 = "BlockOfficeCreateExecContentProcs"
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L0_1 = {}
L0_1[".bat"] = true
L0_1[".cmd"] = true
L0_1[".hta"] = true
L0_1[".jar"] = true
L0_1[".js"] = true
L0_1[".jse"] = true
L0_1[".lnk"] = true
L0_1[".pif"] = true
L0_1[".ps1"] = true
L0_1[".psc1"] = true
L0_1[".settingcontent-ms"] = true
L0_1[".appcontent-ms"] = true
L0_1[".application"] = true
L0_1[".scr"] = true
L0_1[".sys"] = true
L0_1[".vbe"] = true
L0_1[".vbs"] = true
L0_1[".wsc"] = true
L0_1[".wsf"] = true
L0_1[".wsh"] = true
L0_1[".ocx"] = true
L0_1[".com"] = true
L0_1[".exe"] = true
L0_1[".dll"] = true
L0_1[".xll"] = true
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "(%.[^%.]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILEPATH
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
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
L4_1 = L3_1
L5_1 = "\\"
L6_1 = L1_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = mp
L5_1 = L5_1.IsPathExcludedForHipsRule
L6_1 = L4_1
L7_1 = "3b576869-a4ec-4529-8536-b80a7769e899"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = MpCommon
L5_1 = L5_1.ExpandEnvironmentVariables
L6_1 = "%programdata%"
L5_1 = L5_1(L6_1)
if L5_1 == nil then
  L6_1 = ""
  if L6_1 then
    goto lbl_175
  end
end
L6_1 = L5_1
::lbl_175::
L7_1 = L6_1
L6_1 = L6_1.lower
L6_1 = L6_1(L7_1)
L5_1 = L6_1
L6_1 = MpCommon
L6_1 = L6_1.ExpandEnvironmentVariables
L7_1 = "%systemdrive%"
L6_1 = L6_1(L7_1)
if L6_1 == nil then
  L7_1 = ""
  if L7_1 then
    goto lbl_188
  end
end
L7_1 = L6_1
::lbl_188::
L8_1 = L7_1
L7_1 = L7_1.lower
L7_1 = L7_1(L8_1)
L6_1 = L7_1
L7_1 = MpCommon
L7_1 = L7_1.ExpandEnvironmentVariables
L8_1 = "%systemroot%"
L7_1 = L7_1(L8_1)
if L7_1 == nil then
  L8_1 = ""
  if L8_1 then
    goto lbl_201
  end
end
L8_1 = L7_1
::lbl_201::
L9_1 = L8_1
L8_1 = L8_1.lower
L8_1 = L8_1(L9_1)
L7_1 = L8_1
L8_1 = string
L8_1 = L8_1.lower
L9_1 = mp
L9_1 = L9_1.ContextualExpandEnvironmentVariables
L10_1 = "%userprofile%"
L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L9_1(L10_1)
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
L9_1 = nil
if L8_1 ~= nil and L8_1 ~= "" then
  L10_1 = string
  L10_1 = L10_1.match
  L11_1 = L8_1
  L12_1 = "(%a:.*\\)[^\\]+$"
  L10_1 = L10_1(L11_1, L12_1)
  L9_1 = L10_1
end
L10_1 = MpCommon
L10_1 = L10_1.ExpandEnvironmentVariables
L11_1 = "%programfiles%"
L10_1 = L10_1(L11_1)
if L10_1 == nil then
  L11_1 = ""
  if L11_1 then
    goto lbl_232
  end
end
L11_1 = L10_1
::lbl_232::
L12_1 = L11_1
L11_1 = L11_1.lower
L11_1 = L11_1(L12_1)
L10_1 = L11_1
L11_1 = L0_1[L2_1]
if L11_1 == true then
  if L2_1 == ".lnk" then
    L12_1 = L3_1
    L11_1 = L3_1.find
    L13_1 = L6_1
    L14_1 = "\\appsensevirtual\\"
    L13_1 = L13_1 .. L14_1
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 ~= nil then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    L12_1 = L3_1
    L11_1 = L3_1.find
    L13_1 = L7_1
    L14_1 = "\\syswow64\\config\\systemprofile\\appdata\\roaming\\microsoft\\office\\"
    L13_1 = L13_1 .. L14_1
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 ~= nil then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    if L9_1 ~= nil and L9_1 ~= "" then
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\roaming\\microsoft\\office\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\roaming\\microsoft\\excel\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\roaming\\microsoft\\onenote\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\roaming\\microsoft\\outlook\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\roaming\\microsoft\\olk\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\roaming\\microsoft\\powerpoint\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\roaming\\microsoft\\word\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\roaming\\microsoft\\internet explorer\\quick launch"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\local\\packages\\microsoft.office.desktop_8wekyb3d8bbwe\\localcache\\roaming\\microsoft\\internet explorer\\quick launch"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\local\\packages\\microsoft.office.desktop_8wekyb3d8bbwe\\localcache\\roaming\\microsoft\\office\\recent"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\local\\packages\\microsoft.office.desktop_8wekyb3d8bbwe\\localcache\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\local\\invincea\\enterprise\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\documents\\my data sources"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\onedrive\\documents\\my data sources"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
    end
    L11_1 = mp
    L11_1 = L11_1.getfilename
    L12_1 = mp
    L12_1 = L12_1.FILEPATH_QUERY_LOWERCASE
    L11_1 = L11_1(L12_1)
    if L11_1 ~= nil then
      L13_1 = L11_1
      L12_1 = L11_1.find
      L14_1 = "\\device\\harddiskvolume%d+\\users\\[^\\]+\\appdata\\roaming\\microsoft\\office\\"
      L12_1 = L12_1(L13_1, L14_1)
      if L12_1 ~= nil then
        L12_1 = mp
        L12_1 = L12_1.CLEAN
        return L12_1
      end
    end
    L12_1 = mp
    L12_1 = L12_1.get_mpattribute
    L13_1 = "BM_LNK_FILE"
    L12_1 = L12_1(L13_1)
    if L12_1 then
      L12_1 = {}
      L12_1[".doc"] = true
      L12_1[".docx"] = true
      L12_1[".docm"] = true
      L12_1[".xls"] = true
      L12_1[".xlsx"] = true
      L12_1[".xlsm"] = true
      L12_1[".ppt"] = true
      L12_1[".pptx"] = true
      L12_1[".accdb"] = true
      L13_1 = mp
      L13_1 = L13_1.GetLnkInfo
      L13_1 = L13_1()
      if L13_1 ~= nil and L13_1 ~= "" then
        L14_1 = L13_1.BasePath
        if L14_1 ~= nil and L14_1 ~= "" then
          L15_1 = string
          L15_1 = L15_1.match
          L16_1 = L14_1
          L17_1 = "(%.[^%.]+)$"
          L15_1 = L15_1(L16_1, L17_1)
          if L15_1 ~= nil and L15_1 ~= "" then
            L16_1 = string
            L16_1 = L16_1.lower
            L17_1 = L15_1
            L16_1 = L16_1(L17_1)
            L16_1 = L12_1[L16_1]
            if L16_1 == true then
              L16_1 = mp
              L16_1 = L16_1.CLEAN
              return L16_1
            end
          else
            L16_1 = L13_1.RelativePath
            if L16_1 ~= nil or L16_1 ~= "" then
              L17_1 = string
              L17_1 = L17_1.match
              L18_1 = L16_1
              L19_1 = "(%.[^%.]+)$"
              L17_1 = L17_1(L18_1, L19_1)
              if L17_1 ~= nil and L17_1 ~= "" then
                L18_1 = string
                L18_1 = L18_1.lower
                L19_1 = L17_1
                L18_1 = L18_1(L19_1)
                L18_1 = L12_1[L18_1]
                if L18_1 == true then
                  L18_1 = mp
                  L18_1 = L18_1.CLEAN
                  return L18_1
                end
              end
            end
          end
        end
      end
    end
  elseif L2_1 == ".js" then
    if L9_1 ~= nil and L9_1 ~= "" then
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\local\\microsoft\\windows\\inetcache\\ie\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\local\\microsoft\\windows\\temporary internet files\\content.ie5\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\local\\microsoft\\windows\\inetcache1\\temporary internet files\\ie\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\local\\packages\\microsoft.office.desktop_8wekyb3d8bbwe\\ac\\inetcache\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L4_1
      L11_1 = L4_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\local\\microsoft\\office\\[%d%.]+\\smartlookupcache\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\local\\microsoft\\office\\[%d%.]+\\wef\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L3_1
      L11_1 = L3_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\appdata\\roaming\\refinitiv\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L4_1
      L11_1 = L4_1.find
      L13_1 = L9_1
      L14_1 = "[^\\]+\\inetcache\\ie\\"
      L13_1 = L13_1 .. L14_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
    end
    L11_1 = mp
    L11_1 = L11_1.ContextualGetShellKnownFolder
    L12_1 = "352481E8-33BE-4251-BA85-6007CAEDCF9D"
    L11_1 = L11_1(L12_1)
    if L11_1 ~= nil and L11_1 ~= "" then
      L13_1 = L3_1
      L12_1 = L3_1.find
      L14_1 = L11_1
      L15_1 = "\\ie"
      L14_1 = L14_1 .. L15_1
      L15_1 = 1
      L16_1 = true
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      if L12_1 ~= nil then
        L12_1 = mp
        L12_1 = L12_1.CLEAN
        return L12_1
      end
    end
  elseif L2_1 == ".application" then
    L12_1 = L1_1
    L11_1 = L1_1.find
    L13_1 = "^%w%w%w%w%w%w%w%w%.%w%w%w%.application$"
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 ~= nil then
      if L9_1 ~= nil and L9_1 ~= "" then
        L12_1 = L3_1
        L11_1 = L3_1.find
        L13_1 = L9_1
        L14_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\%w%w%w%w%w%w%w%w%.%w%w%w"
        L13_1 = L13_1 .. L14_1
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 ~= nil then
          L11_1 = mp
          L11_1 = L11_1.CLEAN
          return L11_1
        end
      end
      if L9_1 ~= nil and L9_1 ~= "" then
        L12_1 = L3_1
        L11_1 = L3_1.find
        L13_1 = L9_1
        L14_1 = "[^\\]+\\appdata\\local\\temp\\%d+\\deployment\\%w%w%w%w%w%w%w%w%.%w%w%w"
        L13_1 = L13_1 .. L14_1
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 ~= nil then
          L11_1 = mp
          L11_1 = L11_1.CLEAN
          return L11_1
        end
      end
      L12_1 = L3_1
      L11_1 = L3_1.match
      L13_1 = "\\deployment\\%w%w%w%w%w%w%w%w%.%w%w%w$"
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 ~= nil and L8_1 ~= nil and L8_1 ~= "" then
        L12_1 = L8_1
        L13_1 = "\\appdata\\local\\temp"
        L14_1 = L11_1
        L12_1 = L12_1 .. L13_1 .. L14_1
        if L3_1 == L12_1 then
          L12_1 = mp
          L12_1 = L12_1.CLEAN
          return L12_1
        end
      end
      L13_1 = L3_1
      L12_1 = L3_1.match
      L14_1 = ":\\users\\local_.*\\temp\\deployment\\%w%w%w%w%w%w%w%w%.%w%w%w"
      L12_1 = L12_1(L13_1, L14_1)
      if L12_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
    end
  elseif L2_1 == ".dll" or L2_1 == ".exe" then
    L11_1 = mp
    L11_1 = L11_1.IsTrustedFile
    L12_1 = false
    L11_1, L12_1 = L11_1(L12_1)
    if L11_1 == true then
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
    L13_1 = mp
    L13_1 = L13_1.get_mpattribute
    L14_1 = "Lua:SignedThinkCellComponent"
    L13_1 = L13_1(L14_1)
    if L13_1 then
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
    if L2_1 == ".dll" then
      L13_1 = mp
      L13_1 = L13_1.get_mpattribute
      L14_1 = "SOAPSchema.A"
      L13_1 = L13_1(L14_1)
      if L13_1 then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
    end
    if L9_1 ~= nil and L9_1 ~= "" then
      L14_1 = L3_1
      L13_1 = L3_1.find
      L15_1 = L9_1
      L16_1 = "[^\\]+\\appdata\\local\\assembly\\tmp\\"
      L15_1 = L15_1 .. L16_1
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
      L14_1 = L3_1
      L13_1 = L3_1.find
      L15_1 = L9_1
      L16_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\"
      L15_1 = L15_1 .. L16_1
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
      L14_1 = L4_1
      L13_1 = L4_1.find
      L15_1 = L9_1
      L16_1 = "[^\\]+\\appdata\\local\\apps\\2.0\\.+\\dealanalysistool.dll"
      L15_1 = L15_1 .. L16_1
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
      L14_1 = L4_1
      L13_1 = L4_1.find
      L15_1 = L9_1
      L16_1 = "[^\\]+\\appdata\\local\\microsoft\\msoidentitycrl\\production\\[^\\]+%.dll$"
      L15_1 = L15_1 .. L16_1
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
      L14_1 = L4_1
      L13_1 = L4_1.find
      L15_1 = L9_1
      L16_1 = "[^\\]+\\appdata\\local\\microsoft\\onedrive\\%d+%.%d+%.%d+%.%d+\\.+%.dll.*$"
      L15_1 = L15_1 .. L16_1
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
      L14_1 = L4_1
      L13_1 = L4_1.find
      L15_1 = L9_1
      L16_1 = "[^\\]+\\appdata\\local\\microsoft\\windows\\temporary internet files\\content.ie5\\.+%.dll$"
      L15_1 = L15_1 .. L16_1
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
      L14_1 = L4_1
      L13_1 = L4_1.find
      L15_1 = L9_1
      L16_1 = "[^\\]+\\appdata\\local\\microsoft\\teams\\current\\.+%.dll$"
      L15_1 = L15_1 .. L16_1
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
    end
  elseif L2_1 == ".com" and L9_1 ~= nil and L9_1 ~= "" then
    L12_1 = L3_1
    L11_1 = L3_1.find
    L13_1 = L9_1
    L14_1 = "[^\\]+\\appdata\\local\\temp\\microsoft\\team foundation\\[^\\]+\\cache\\avatars\\"
    L13_1 = L13_1 .. L14_1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 ~= nil then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
  end
  L11_1 = mp
  L11_1 = L11_1.set_mpattribute
  L12_1 = "MpDisableCaching"
  L11_1(L12_1)
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
else
  L12_1 = L3_1
  L11_1 = L3_1.find
  L13_1 = L5_1
  L14_1 = "\\microsoft\\windows\\start menu\\programs\\startup"
  L13_1 = L13_1 .. L14_1
  L14_1 = 1
  L15_1 = true
  L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
  if L11_1 ~= nil then
    L11_1 = mp
    L11_1 = L11_1.INFECTED
    return L11_1
  end
  if L9_1 ~= nil and L9_1 ~= "" then
    L12_1 = L3_1
    L11_1 = L3_1.find
    L13_1 = L9_1
    L14_1 = "[^\\]+\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup"
    L13_1 = L13_1 .. L14_1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 ~= nil then
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      return L11_1
    end
  end
  L11_1 = mp
  L11_1 = L11_1.get_mpattribute
  L12_1 = "BM_CONTAINER_FILE"
  L11_1 = L11_1(L12_1)
  if not L11_1 then
    L11_1 = mp
    L11_1 = L11_1.get_mpattribute
    L12_1 = "BM_SCRIPT_OR_TEXT_FILE"
    L11_1 = L11_1(L12_1)
    if not L11_1 then
      goto lbl_872
    end
  end
  L11_1 = MpCommon
  L11_1 = L11_1.QueryPersistContext
  L12_1 = L4_1
  L13_1 = "DroppedByOfficeProc"
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 then
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
  L11_1 = MpCommon
  L11_1 = L11_1.AppendPersistContext
  L12_1 = L4_1
  L13_1 = "DroppedByOfficeProc"
  L14_1 = 0
  L11_1(L12_1, L13_1, L14_1)
  L11_1 = mp
  L11_1 = L11_1.ReportLowfi
  L12_1 = mp
  L12_1 = L12_1.getfilename
  L12_1 = L12_1()
  L13_1 = 1585622778
  L11_1(L12_1, L13_1)
  L11_1 = mp
  L11_1 = L11_1.set_mpattribute
  L12_1 = "MpDisableCaching"
  L11_1(L12_1)
end
::lbl_872::
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
