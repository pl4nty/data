-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaSuspPackgeConfig\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4 = nil, nil, nil
local l_0_5 = {}
if (mp.get_mpattribute)("SCPT:NpmJson") then
  l_0_4 = "npmPackage"
  if l_0_1 ~= "package.json" then
    return mp.CLEAN
  end
  if (string.find)(l_0_0, "node_modules", 1, true) == nil then
    return mp.CLEAN
  end
  local l_0_6 = {}
  l_0_6.preinstall = true
  l_0_6.postinstall = true
  l_0_6.prepare = true
  l_0_5 = l_0_6
end
do
  if (mp.get_mpattribute)("SCPT:SuspTaskConfig") then
    l_0_2 = "vsCodeTask"
  else
    if (mp.get_mpattribute)("SCPT:SuspClaudeConfig") then
      l_0_3 = "claudeSettings"
    end
  end
  do
    if l_0_2 or l_0_3 then
      local l_0_7 = {}
      l_0_7.command = true
      l_0_5 = l_0_7
    end
    local l_0_8 = "\"([%w%-]+)\"%s*:%s*\"([^\"]+)"
    local l_0_9 = "(?i)(?:node(?:\\.exe)?\\s+-e\\s*(?:\\\\+)?[\'\"]?.{50,}|(?:/usr/bin/|/bin/)?(?:sh|bash)\\s+-c\\s*(?!.*yarn\\.lock).*|curl\\s*.*|wget\\s*.*|certutil\\s*.*|powershell\\s*.*|cmd(?:\\.exe)?\\s+/c\\s*.*)"
    local l_0_10 = "(?i)^\\s*(?:node|bun)(?:\\.exe)?\\s+(?:run\\s+)?(?:\\.?/)?([\\w/ \\.\\-_]+\\.(?:js|cjs|mjs))"
    ;
    (mp.readprotection)(false)
    local l_0_11 = (mp.getfilesize)()
    local l_0_12 = (mp.readfile)(0, l_0_11)
    ;
    (mp.readprotection)(true)
    l_0_12 = (string.gsub)(l_0_12, "\\\"", "&quot;")
    local l_0_13 = false
    local l_0_14, l_0_15, l_0_16 = nil, nil, nil
    for l_0_20,l_0_21 in (string.gmatch)(l_0_12, l_0_8) do
      if l_0_20 == "name" then
        l_0_14 = l_0_21
      else
        if l_0_20 == "version" then
          l_0_15 = l_0_21
        else
          if l_0_20 == "label" then
            l_0_16 = l_0_21
          end
        end
      end
    end
    for l_0_25,l_0_26 in (string.gmatch)(l_0_12, l_0_8) do
      if l_0_5[l_0_25] then
        l_0_26 = (string.gsub)(l_0_26, "&quot;", "\"")
        if (MpCommon.StringRegExpSearch)(l_0_9, l_0_26) or (MpCommon.StringRegExpSearch)(l_0_10, l_0_26) then
          l_0_13 = l_0_26
          break
        end
      end
    end
    do
      if l_0_13 then
        local l_0_27 = {}
        -- DECOMPILER ERROR at PC185: Confused about usage of register: R16 in 'UnsetPending'

        if l_0_2 or l_0_3 or l_0_4 then
          (table.insert)(l_0_27, l_0_2 or l_0_3 or l_0_4)
        end
        if l_0_14 then
          (table.insert)(l_0_27, l_0_14)
        end
        if l_0_15 then
          (table.insert)(l_0_27, l_0_15)
        end
        if l_0_16 then
          (table.insert)(l_0_27, l_0_16)
        end
        ;
        (table.insert)(l_0_27, l_0_13)
        l_0_13 = (table.concat)(l_0_27, ":")
        local l_0_29 = nil
        if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID) ~= nil then
          TT_SendBMSigTrigger((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "JsonPayload", l_0_13)
        end
      end
      do
        do
          do return mp.CLEAN end
          -- DECOMPILER ERROR at PC234: freeLocal<0 in 'ReleaseLocals'

        end
      end
    end
  end
end

