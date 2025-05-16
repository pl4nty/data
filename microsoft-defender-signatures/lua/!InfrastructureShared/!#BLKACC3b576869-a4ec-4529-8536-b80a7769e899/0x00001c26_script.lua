-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#BLKACC3b576869-a4ec-4529-8536-b80a7769e899\0x00001c26_luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("3b576869-a4ec-4529-8536-b80a7769e899") then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if GetCtxOfficeProc() ~= "productivity" then
  if (MpCommon.GetPersistContextCountNoPath)("BlockOfficeCreateExecContentProcs") == 0 then
    return mp.CLEAN
  end
  local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_0 == "" or l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 == "" or l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(l_0_1)
  local l_0_2 = l_0_1 .. "+" .. l_0_0
  if not (MpCommon.QueryPersistContextNoPath)("BlockOfficeCreateExecContentProcs", l_0_2) then
    return mp.CLEAN
  end
end
do
  local l_0_3 = {}
  l_0_3[".bat"] = true
  l_0_3[".cmd"] = true
  l_0_3[".hta"] = true
  l_0_3[".jar"] = true
  l_0_3[".js"] = true
  l_0_3[".jse"] = true
  l_0_3[".lnk"] = true
  l_0_3[".pif"] = true
  l_0_3[".ps1"] = true
  l_0_3[".psc1"] = true
  l_0_3[".settingcontent-ms"] = true
  l_0_3[".appcontent-ms"] = true
  l_0_3[".application"] = true
  l_0_3[".scr"] = true
  l_0_3[".sys"] = true
  l_0_3[".vbe"] = true
  l_0_3[".vbs"] = true
  l_0_3[".wsc"] = true
  l_0_3[".wsf"] = true
  l_0_3[".wsh"] = true
  l_0_3[".ocx"] = true
  l_0_3[".com"] = true
  l_0_3[".exe"] = true
  l_0_3[".dll"] = true
  l_0_3[".xll"] = true
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
  if l_0_4 == nil or l_0_4 == "" then
    return mp.CLEAN
  end
  l_0_4 = (string.lower)(l_0_4)
  local l_0_5 = (string.match)(l_0_4, "(%.[^%.]+)$")
  if l_0_5 == nil then
    return mp.CLEAN
  end
  local l_0_6 = (MpCommon.PathToWin32Path)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH))
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  l_0_6 = (string.lower)(l_0_6)
  local l_0_7 = l_0_6 .. "\\" .. l_0_4
  if (mp.IsPathExcludedForHipsRule)(l_0_7, "3b576869-a4ec-4529-8536-b80a7769e899") then
    return mp.CLEAN
  end
  local l_0_8 = (MpCommon.ExpandEnvironmentVariables)("%programdata%")
  l_0_8 = (l_0_8 == nil and "" or l_0_8):lower()
  local l_0_9 = (MpCommon.ExpandEnvironmentVariables)("%systemdrive%")
  l_0_9 = (l_0_9 == nil and "" or l_0_9):lower()
  local l_0_10 = (MpCommon.ExpandEnvironmentVariables)("%systemroot%")
  l_0_10 = (l_0_10 == nil and "" or l_0_10):lower()
  local l_0_11 = ((string.lower)((mp.ContextualExpandEnvironmentVariables)("%userprofile%")))
  local l_0_12 = nil
  if l_0_11 ~= nil and l_0_11 ~= "" then
    l_0_12 = (string.match)(l_0_11, "(%a:.*\\)[^\\]+$")
  end
  local l_0_13 = (MpCommon.ExpandEnvironmentVariables)("%programfiles%")
  l_0_13 = (l_0_13 == nil and "" or l_0_13):lower()
  if l_0_3[l_0_5] == true then
    if l_0_5 == ".lnk" then
      if l_0_6:find(l_0_9 .. "\\appsensevirtual\\", 1, true) ~= nil then
        return mp.CLEAN
      end
      if l_0_6:find(l_0_10 .. "\\syswow64\\config\\systemprofile\\appdata\\roaming\\microsoft\\office\\", 1, true) ~= nil then
        return mp.CLEAN
      end
      if l_0_12 ~= nil and l_0_12 ~= "" then
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\microsoft\\office\\") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\microsoft\\excel\\") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\microsoft\\onenote\\") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\microsoft\\outlook\\") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\microsoft\\olk\\") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\microsoft\\powerpoint\\") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\microsoft\\word\\") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\microsoft\\internet explorer\\quick launch") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\packages\\microsoft.office.desktop_8wekyb3d8bbwe\\localcache\\roaming\\microsoft\\internet explorer\\quick launch") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\packages\\microsoft.office.desktop_8wekyb3d8bbwe\\localcache\\roaming\\microsoft\\office\\recent") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\packages\\microsoft.office.desktop_8wekyb3d8bbwe\\localcache\\roaming\\microsoft\\windows\\start menu\\programs\\startup") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\invincea\\enterprise\\") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\documents\\my data sources") ~= nil then
          return mp.CLEAN
        end
        if l_0_6:find(l_0_12 .. "[^\\]+\\onedrive\\documents\\my data sources") ~= nil then
          return mp.CLEAN
        end
      end
      local l_0_14 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
      if l_0_14 ~= nil and l_0_14:find("\\device\\harddiskvolume%d+\\users\\[^\\]+\\appdata\\roaming\\microsoft\\office\\") ~= nil then
        return mp.CLEAN
      end
      if (mp.get_mpattribute)("BM_LNK_FILE") then
        local l_0_15 = {}
        l_0_15[".doc"] = true
        l_0_15[".docx"] = true
        l_0_15[".docm"] = true
        l_0_15[".xls"] = true
        l_0_15[".xlsx"] = true
        l_0_15[".xlsm"] = true
        l_0_15[".ppt"] = true
        l_0_15[".pptx"] = true
        l_0_15[".accdb"] = true
        local l_0_16 = (mp.GetLnkInfo)()
        if l_0_16 ~= nil and l_0_16 ~= "" then
          local l_0_17 = l_0_16.BasePath
          if l_0_17 ~= nil and l_0_17 ~= "" then
            local l_0_18 = (string.match)(l_0_17, "(%.[^%.]+)$")
            -- DECOMPILER ERROR at PC478: Unhandled construct in 'MakeBoolean' P1

            if l_0_18 ~= nil and l_0_18 ~= "" and l_0_15[(string.lower)(l_0_18)] == true then
              return mp.CLEAN
            end
          end
        end
      end
      local l_0_19 = l_0_16.RelativePath
      if l_0_19 ~= nil or l_0_19 ~= "" then
        local l_0_20 = (string.match)(l_0_19, "(%.[^%.]+)$")
        if l_0_20 ~= nil and l_0_20 ~= "" and l_0_15[(string.lower)(l_0_20)] == true then
          return mp.CLEAN
        end
      end
    else
      do
        if l_0_5 == ".js" then
          if l_0_12 ~= nil and l_0_12 ~= "" then
            if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\microsoft\\windows\\inetcache\\ie\\") ~= nil then
              return mp.CLEAN
            end
            if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\microsoft\\windows\\temporary internet files\\content.ie5\\") ~= nil then
              return mp.CLEAN
            end
            if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\microsoft\\windows\\inetcache1\\temporary internet files\\ie\\") ~= nil then
              return mp.CLEAN
            end
            if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\packages\\microsoft.office.desktop_8wekyb3d8bbwe\\ac\\inetcache\\") ~= nil then
              return mp.CLEAN
            end
            if l_0_7:find(l_0_12 .. "[^\\]+\\appdata\\local\\microsoft\\office\\[%d%.]+\\smartlookupcache\\") ~= nil then
              return mp.CLEAN
            end
            if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\microsoft\\office\\[%d%.]+\\wef\\") ~= nil then
              return mp.CLEAN
            end
            if l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\refinitiv\\") ~= nil then
              return mp.CLEAN
            end
            if l_0_7:find(l_0_12 .. "[^\\]+\\inetcache\\ie\\") ~= nil then
              return mp.CLEAN
            end
          end
          local l_0_21 = (mp.ContextualGetShellKnownFolder)("352481E8-33BE-4251-BA85-6007CAEDCF9D")
          if l_0_21 ~= nil and l_0_21 ~= "" and l_0_6:find(l_0_21 .. "\\ie", 1, true) ~= nil then
            return mp.CLEAN
          end
        else
          do
            -- DECOMPILER ERROR at PC632: Unhandled construct in 'MakeBoolean' P1

            if l_0_5 == ".application" and l_0_4:find("^%w%w%w%w%w%w%w%w%.%w%w%w%.application$") ~= nil then
              if l_0_12 ~= nil and l_0_12 ~= "" and l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\temp\\deployment\\%w%w%w%w%w%w%w%w%.%w%w%w") ~= nil then
                return mp.CLEAN
              end
              if l_0_12 ~= nil and l_0_12 ~= "" and l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\temp\\%d+\\deployment\\%w%w%w%w%w%w%w%w%.%w%w%w") ~= nil then
                return mp.CLEAN
              end
              local l_0_22 = l_0_6:match("\\deployment\\%w%w%w%w%w%w%w%w%.%w%w%w$")
              if l_0_22 ~= nil and l_0_11 ~= nil and l_0_11 ~= "" and l_0_6 == l_0_11 .. "\\appdata\\local\\temp" .. l_0_22 then
                return mp.CLEAN
              end
              if l_0_6:match(":\\users\\local_.*\\temp\\deployment\\%w%w%w%w%w%w%w%w%.%w%w%w") ~= nil then
                return mp.CLEAN
              end
            end
            do
              if l_0_5 == ".dll" or l_0_5 == ".exe" then
                local l_0_23, l_0_24, l_0_25, l_0_26, l_0_27 = (mp.IsTrustedFile)(false)
                if l_0_23 == true then
                  l_0_25 = mp
                  l_0_25 = l_0_25.CLEAN
                  return l_0_25
                end
                l_0_25 = mp
                l_0_25 = l_0_25.get_mpattribute
                l_0_26 = "Lua:SignedThinkCellComponent"
                l_0_25 = l_0_25(l_0_26)
                if l_0_25 then
                  l_0_25 = mp
                  l_0_25 = l_0_25.CLEAN
                  return l_0_25
                end
                if l_0_5 == ".dll" then
                  l_0_25 = mp
                  l_0_25 = l_0_25.get_mpattribute
                  l_0_26 = "SOAPSchema.A"
                  l_0_25 = l_0_25(l_0_26)
                  if l_0_25 then
                    l_0_25 = mp
                    l_0_25 = l_0_25.CLEAN
                    return l_0_25
                  end
                end
                if l_0_12 ~= nil and l_0_12 ~= "" then
                  l_0_25, l_0_26 = l_0_6:find, l_0_6
                  l_0_27 = l_0_12
                  l_0_27 = l_0_27 .. "[^\\]+\\appdata\\local\\assembly\\tmp\\"
                  l_0_25 = l_0_25(l_0_26, l_0_27)
                  if l_0_25 ~= nil then
                    l_0_25 = mp
                    l_0_25 = l_0_25.CLEAN
                    return l_0_25
                  end
                  l_0_25, l_0_26 = l_0_6:find, l_0_6
                  l_0_27 = l_0_12
                  l_0_27 = l_0_27 .. "[^\\]+\\appdata\\local\\temp\\deployment\\"
                  l_0_25 = l_0_25(l_0_26, l_0_27)
                  if l_0_25 ~= nil then
                    l_0_25 = mp
                    l_0_25 = l_0_25.CLEAN
                    return l_0_25
                  end
                  l_0_25, l_0_26 = l_0_7:find, l_0_7
                  l_0_27 = l_0_12
                  l_0_27 = l_0_27 .. "[^\\]+\\appdata\\local\\apps\\2.0\\.+\\dealanalysistool.dll"
                  l_0_25 = l_0_25(l_0_26, l_0_27)
                  if l_0_25 ~= nil then
                    l_0_25 = mp
                    l_0_25 = l_0_25.CLEAN
                    return l_0_25
                  end
                  l_0_25, l_0_26 = l_0_7:find, l_0_7
                  l_0_27 = l_0_12
                  l_0_27 = l_0_27 .. "[^\\]+\\appdata\\local\\microsoft\\msoidentitycrl\\production\\[^\\]+%.dll$"
                  l_0_25 = l_0_25(l_0_26, l_0_27)
                  if l_0_25 ~= nil then
                    l_0_25 = mp
                    l_0_25 = l_0_25.CLEAN
                    return l_0_25
                  end
                  l_0_25, l_0_26 = l_0_7:find, l_0_7
                  l_0_27 = l_0_12
                  l_0_27 = l_0_27 .. "[^\\]+\\appdata\\local\\microsoft\\onedrive\\%d+%.%d+%.%d+%.%d+\\.+%.dll.*$"
                  l_0_25 = l_0_25(l_0_26, l_0_27)
                  if l_0_25 ~= nil then
                    l_0_25 = mp
                    l_0_25 = l_0_25.CLEAN
                    return l_0_25
                  end
                  l_0_25, l_0_26 = l_0_7:find, l_0_7
                  l_0_27 = l_0_12
                  l_0_27 = l_0_27 .. "[^\\]+\\appdata\\local\\microsoft\\windows\\temporary internet files\\content.ie5\\.+%.dll$"
                  l_0_25 = l_0_25(l_0_26, l_0_27)
                  if l_0_25 ~= nil then
                    l_0_25 = mp
                    l_0_25 = l_0_25.CLEAN
                    return l_0_25
                  end
                  l_0_25, l_0_26 = l_0_7:find, l_0_7
                  l_0_27 = l_0_12
                  l_0_27 = l_0_27 .. "[^\\]+\\appdata\\local\\microsoft\\teams\\current\\.+%.dll$"
                  l_0_25 = l_0_25(l_0_26, l_0_27)
                  if l_0_25 ~= nil then
                    l_0_25 = mp
                    l_0_25 = l_0_25.CLEAN
                    return l_0_25
                  end
                end
              else
                do
                  if l_0_5 == ".com" and l_0_12 ~= nil and l_0_12 ~= "" and l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\local\\temp\\microsoft\\team foundation\\[^\\]+\\cache\\avatars\\") ~= nil then
                    return mp.CLEAN
                  end
                  ;
                  (mp.set_mpattribute)("MpDisableCaching")
                  do return mp.INFECTED end
                  if l_0_6:find(l_0_8 .. "\\microsoft\\windows\\start menu\\programs\\startup", 1, true) ~= nil then
                    return mp.INFECTED
                  end
                  if l_0_12 ~= nil and l_0_12 ~= "" and l_0_6:find(l_0_12 .. "[^\\]+\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") ~= nil then
                    return mp.INFECTED
                  end
                  if (mp.get_mpattribute)("BM_CONTAINER_FILE") or (mp.get_mpattribute)("BM_SCRIPT_OR_TEXT_FILE") then
                    if (MpCommon.QueryPersistContext)(l_0_7, "DroppedByOfficeProc") then
                      return mp.CLEAN
                    end
                    ;
                    (MpCommon.AppendPersistContext)(l_0_7, "DroppedByOfficeProc", 0)
                    ;
                    (mp.ReportLowfi)((mp.getfilename)(), 1585622778)
                    ;
                    (mp.set_mpattribute)("MpDisableCaching")
                  end
                  return mp.CLEAN
                end
              end
            end
          end
        end
      end
    end
  end
end

