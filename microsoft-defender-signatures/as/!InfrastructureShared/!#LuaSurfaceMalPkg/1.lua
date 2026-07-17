-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaSurfaceMalPkg\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattributesubstring)("Detection:Trojan:JS") and not (mp.get_mpattributesubstring)("Detection:Trojan:AIGen") and not (mp.get_mpattributesubstring)("Detection:Trojan:Script") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FileExtensionAttr!js") and not (mp.get_mpattribute)("Lua:FileExtensionAttr!mjs") and not (mp.get_mpattribute)("Lua:FileExtensionAttr!cjs") and not (mp.get_mpattribute)("Lua:FileExtensionAttr!gyp") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_0, "node_modules", 1, true) == nil then
  return mp.CLEAN
end
local l_0_2 = false
local l_0_3, l_0_4 = nil, nil
local l_0_5 = false
if (versioning.GetHostOsType)() == 1 then
  l_0_2 = true
end
if l_0_1 == "binding.gyp" then
  if l_0_2 then
    l_0_3 = (MpCommon.PathToWin32Path)(l_0_0 .. "\\" .. "package.json")
  else
    l_0_3 = l_0_0 .. "/" .. "package.json"
  end
  l_0_5 = true
end
if not l_0_5 then
  if l_0_2 then
    l_0_3 = (MpCommon.PathToWin32Path)(l_0_0 .. "\\" .. "package.json")
    l_0_4 = l_0_0 .. "\\" .. "binding.gyp"
    if not (sysio.IsFileExists)(l_0_3) then
      local l_0_6 = l_0_0:match("(.+)\\")
      if l_0_6 then
        l_0_3 = l_0_6 .. "\\" .. "package.json"
        l_0_4 = l_0_6 .. "\\" .. "binding.gyp"
        l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
      end
    end
  else
    do
      l_0_3 = l_0_0 .. "/" .. "package.json"
      l_0_4 = l_0_0 .. "/" .. "binding.gyp"
      do
        if not (sysio.IsFileExists)(l_0_3) then
          local l_0_7 = l_0_0:match("(.+)/")
          if l_0_7 then
            l_0_3 = l_0_7 .. "/" .. "package.json"
            l_0_4 = l_0_7 .. "/" .. "binding.gyp"
          end
        end
        if not (sysio.IsFileExists)(l_0_3) then
          return mp.CLEAN
        end
        local l_0_8 = (sysio.GetFileSize)(l_0_3)
        local l_0_9 = ((sysio.ReadFile)(l_0_3, 0, l_0_8))
        local l_0_10, l_0_11 = nil, nil
        local l_0_12 = "\"([%w%-]+)\"%s*:%s*\"([^\"]+)"
        local l_0_13 = false
        for l_0_17,l_0_18 in (string.gmatch)(l_0_9, l_0_12) do
          if l_0_17 == "name" then
            l_0_10 = l_0_18
          else
            if l_0_17 == "version" then
              l_0_11 = l_0_18
            end
          end
        end
        if l_0_5 then
          (mp.readprotection)(false)
          local l_0_19 = (mp.getfilesize)()
          local l_0_20 = (mp.readfile)(0, l_0_19)
          ;
          (mp.readprotection)(true)
          do
            if (string.find)(l_0_20, "sources", 1, true) then
              local l_0_21 = (string.match)(l_0_20, "\"sources\"%s*:%s*%[%s*[\"\']<!%%?%(([^\"\']+)%)%s*[\"\']")
              if l_0_21 then
                l_0_13 = "binding.gyp:" .. l_0_21
              end
            end
            do
              local l_0_22 = {}
              if l_0_10 then
                (table.insert)(l_0_22, l_0_10)
              end
              if l_0_11 then
                (table.insert)(l_0_22, l_0_11)
              end
              ;
              (table.insert)(l_0_22, l_0_13)
              l_0_13 = (table.concat)(l_0_22, ":")
              local l_0_23 = {}
              l_0_23.preinstall = true
              l_0_23.postinstall = true
              for l_0_27,l_0_28 in (string.gmatch)(l_0_9, l_0_12) do
                if l_0_23[l_0_27] and (MpCommon.StringRegExpSearch)(l_0_1, l_0_28) then
                  l_0_13 = l_0_27 .. ":" .. l_0_28
                  break
                end
              end
              do
                if not l_0_13 and l_0_4 then
                  if l_0_2 then
                    l_0_4 = (MpCommon.PathToWin32Path)(l_0_4)
                  end
                  if (sysio.IsFileExists)(l_0_4) then
                    local l_0_29 = (sysio.GetFileSize)(l_0_4)
                    local l_0_30 = (sysio.ReadFile)(l_0_4, 0, l_0_29)
                    if (string.find)(l_0_30, "sources", 1, true) then
                      local l_0_31 = (string.match)(l_0_30, "\"sources\"%s*:%s*%[%s*[\"\']<!%%?%(([^\"\']+)%)%s*[\"\']")
                      if l_0_31 and (MpCommon.StringRegExpSearch)(l_0_1, l_0_31) then
                        l_0_13 = "binding.gyp:" .. l_0_31
                      end
                    end
                  end
                end
                do
                  do
                    if l_0_13 then
                      local l_0_32 = {}
                      if l_0_10 then
                        (table.insert)(l_0_32, l_0_10)
                      end
                      if l_0_11 then
                        (table.insert)(l_0_32, l_0_11)
                      end
                      ;
                      (table.insert)(l_0_32, l_0_13)
                      l_0_13 = (table.concat)(l_0_32, ":")
                    end
                    if l_0_13 then
                      local l_0_33 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
                      if l_0_33 ~= nil then
                        TT_SendBMSigTrigger(l_0_33, "MaliciousPackage", l_0_13)
                      else
                        if l_0_2 then
                          local l_0_34 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
                          if l_0_34 then
                            local l_0_35 = l_0_34 .. "\\system32\\"
                            local l_0_36 = (sysio.GetProcessFromFileName)(l_0_35 .. "services.exe")
                            if #l_0_36 > 0 then
                              local l_0_37 = (string.format)("pid:%d,ProcessStart:%u", (l_0_36[1]).pid, (l_0_36[1]).starttime)
                              if l_0_37 then
                                TT_SendBMSigTrigger(l_0_37, "MaliciousPackage", l_0_13)
                              end
                            end
                          end
                        end
                      end
                    end
                    do
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
  end
end

