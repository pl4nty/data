-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaInteractivePSClassifier\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if l_0_0 then
  local l_0_2 = contains
  local l_0_3 = l_0_1
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC25: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC29: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC30: Overwrote pending register: R2 in 'AssignReg'

  if not l_0_2 then
    return l_0_2
  end
end
do
  -- DECOMPILER ERROR at PC32: Overwrote pending register: R2 in 'AssignReg'

  local l_0_5 = (l_0_2.getfilesize)()
  if l_0_5 <= 0 or l_0_5 > 1500 then
    return mp.CLEAN
  end
  local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_6 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

  local l_0_7 = (mp.GetProcessCommandLine)("powershell.exe")
  -- DECOMPILER ERROR at PC60: Overwrote pending register: R6 in 'AssignReg'

  if l_0_7 == nil or (string.len)("pwsh.exe") == 0 then
    return mp.CLEAN
  end
  local l_0_8 = (mp.GetParentProcInfo)(l_0_6)
  if l_0_8 == nil or type(l_0_8.image_path) ~= "string" then
    return mp.CLEAN
  end
  local l_0_9 = (string.lower)(l_0_8.image_path)
  local l_0_10 = (string.find)(l_0_9, "explorer.exe", 1, true)
  if l_0_10 then
    (mp.set_mpattribute)("Lua:MpPowershellAmsiViaCmdLinePPExplorer")
  end
  local l_0_11 = contains
  local l_0_12 = l_0_7
  local l_0_13 = {}
  -- DECOMPILER ERROR at PC104: No list found for R10 , SetList fails

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC109: Overwrote pending register: R8 in 'AssignReg'

  if l_0_11 then
    return l_0_11
  end
  -- DECOMPILER ERROR at PC113: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC114: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC117: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC122: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC123: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC124: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC125: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC131: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC132: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC133: Overwrote pending register: R9 in 'AssignReg'

  if not l_0_10 and not l_0_11 and not l_0_11 then
    l_0_11(l_0_12)
    -- DECOMPILER ERROR at PC135: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC136: Overwrote pending register: R8 in 'AssignReg'

    return l_0_11
  end
  -- DECOMPILER ERROR at PC138: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC139: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC140: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC141: Overwrote pending register: R10 in 'AssignReg'

  if #l_0_11 == 0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC155: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC164: Confused about usage of register: R9 in 'UnsetPending'

  -- DECOMPILER ERROR at PC172: Confused about usage of register: R9 in 'UnsetPending'

  do
    if (string.find)(l_0_11, "$", ".psm1", true) ~= nil and ((string.find)(l_0_11, ".", 1, true) ~= nil or (string.find)(l_0_11, "&", 1, true) ~= nil) then
      local l_0_14 = "(?:^|[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$(?:[a-z_][a-z0-9_]*|\\{(?:(?:global|script|local|private):)?[a-z_][a-z0-9_]*\\}|(?:global|script|local|private):[a-z_][a-z0-9_]*)(?:[ \\t]*\\))?(?:[ \\t]*\\[[^\\]\\r\\n;]+\\])*(?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)"
      if (MpCommon.StringRegExpSearch)(l_0_14, l_0_11) then
        (mp.set_mpattribute)("Lua:InteractivePSDynamicCalling")
      end
    end
    -- DECOMPILER ERROR at PC192: Confused about usage of register: R9 in 'UnsetPending'

    -- DECOMPILER ERROR at PC200: Confused about usage of register: R9 in 'UnsetPending'

    -- DECOMPILER ERROR at PC210: Confused about usage of register: R9 in 'UnsetPending'

    -- DECOMPILER ERROR at PC218: Confused about usage of register: R9 in 'UnsetPending'

    -- DECOMPILER ERROR at PC228: Confused about usage of register: R9 in 'UnsetPending'

    -- DECOMPILER ERROR at PC236: Confused about usage of register: R9 in 'UnsetPending'

    -- DECOMPILER ERROR at PC246: Confused about usage of register: R10 in 'UnsetPending'

    -- DECOMPILER ERROR at PC248: Confused about usage of register: R9 in 'UnsetPending'

    -- DECOMPILER ERROR at PC256: Confused about usage of register: R9 in 'UnsetPending'

    if (string.find)(l_0_11, "$", ".psm1", true) ~= nil and (string.find)(l_0_11, "[", 1, true) ~= nil and (string.find)(l_0_11, "]", 1, true) ~= nil then
      local l_0_24 = (string.find)(l_0_11, "gcm", 1, true) ~= nil or (string.find)(l_0_11, "get-command", 1, true) ~= nil
      local l_0_25 = (string.find)(l_0_11, "gmo", 1, true) ~= nil or (string.find)(l_0_11, "get-module", 1, true) ~= nil
      local l_0_26 = (string.find)(l_0_11, "ipmo", 1, true) ~= nil or (string.find)(l_0_11, "import-module", 1, true) ~= nil
      local l_0_27 = nil
      do
        if l_0_24 then
          local l_0_28 = nil
          -- DECOMPILER ERROR at PC284: Overwrote pending register: R17 in 'AssignReg'

        end
        if not false and (l_0_25 or l_0_26) then
          local l_0_29 = nil
          -- DECOMPILER ERROR at PC297: Confused about usage of register: R9 in 'UnsetPending'

          -- DECOMPILER ERROR at PC305: Confused about usage of register: R9 in 'UnsetPending'

          -- DECOMPILER ERROR at PC313: Confused about usage of register: R9 in 'UnsetPending'

          if (string.find)((string.gsub)(l_0_11, "[%s\'\"%+]", ""), "exportedcommands", 1, true) ~= nil and (string.find)((string.gsub)(l_0_11, "[%s\'\"%+]", ""), "values", 1, true) ~= nil and (string.find)((string.gsub)(l_0_11, "[%s\'\"%+]", ""), "name", 1, true) ~= nil then
            do
              if l_0_25 then
                local l_0_30 = nil
              end
              -- DECOMPILER ERROR at PC337: Confused about usage of register: R9 in 'UnsetPending'

              do
                do
                  if not (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:gmo|get-module)\\b" .. "[^\\r\\n]{0,768}?" .. l_0_30, l_0_11) and l_0_26 and (string.find)(l_0_11, "-pa", 1, true) ~= nil then
                    local l_0_31 = nil
                  end
                  if (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:ipmo|import-module)\\b(?=[^;\\r\\n|]*?\\s-pa(?:s(?:s(?:t(?:h(?:r(?:u)?)?)?)?)?)?\\b)" .. "[^\\r\\n]{0,768}?" .. l_0_31, l_0_11) then
                    (mp.set_mpattribute)("Lua:InteractivePSCommandIndexing")
                  end
                  -- DECOMPILER ERROR at PC361: Confused about usage of register: R11 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC363: Confused about usage of register: R12 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC365: Confused about usage of register: R13 in 'UnsetPending'

                  if not l_0_24 and not l_0_25 and not l_0_26 then
                    return mp.CLEAN
                  end
                  local l_0_42 = nil
                  local l_0_43 = nil
                  do
                    if l_0_42 then
                      local l_0_44 = nil
                      -- DECOMPILER ERROR at PC380: Overwrote pending register: R15 in 'AssignReg'

                      -- DECOMPILER ERROR at PC382: Overwrote pending register: R14 in 'AssignReg'

                    end
                    do
                      if not false and l_0_43 then
                        local l_0_45 = nil
                        -- DECOMPILER ERROR at PC393: Overwrote pending register: R15 in 'AssignReg'

                      end
                      -- DECOMPILER ERROR at PC398: Confused about usage of register: R13 in 'UnsetPending'

                      do
                        if not (MpCommon.StringRegExpSearch)("(?:\\bgmo\\b|\\bget-module\\b)(?:[^;\\r\\n|]*?\\s-n(?:a(?:m(?:e)?)?)?(?:\\s+|:\\s*)|\\s+)([\'\"]?)((?!-)[^\'\"\\s;|),]+)\\1", l_0_11) and l_0_45 then
                          local l_0_46 = nil
                          -- DECOMPILER ERROR at PC406: Overwrote pending register: R15 in 'AssignReg'

                        end
                        if not (MpCommon.StringRegExpSearch)("(?:\\bipmo\\b|\\bimport-module\\b)(?:[^;\\r\\n|]*?\\s-n(?:a(?:m(?:e)?)?)?(?:\\s+|:\\s*)|\\s+)([\'\"]?)((?!-)[^\'\"\\s;|),]+)\\1", l_0_11) then
                          return mp.CLEAN
                        end
                        local l_0_47 = nil
                        if nil == "microsoft.powershell.utility" then
                          (mp.set_mpattribute)("Lua:InteractivePSUtilityModuleSelector")
                          return mp.CLEAN
                        end
                        -- DECOMPILER ERROR at PC424: Confused about usage of register: R9 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC425: Confused about usage of register: R15 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC432: Confused about usage of register: R9 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC433: Confused about usage of register: R15 in 'UnsetPending'

                        if (string.find)(nil, "*", 1, true) == nil and (string.find)(nil, "?", 1, true) == nil then
                          return mp.CLEAN
                        end
                        -- DECOMPILER ERROR at PC445: Confused about usage of register: R15 in 'UnsetPending'

                        do
                          local l_0_48 = nil
                          -- DECOMPILER ERROR at PC473: Confused about usage of register: R16 in 'UnsetPending'

                          if (string.match)("microsoft.powershell.utility", "^" .. (string.gsub)((string.gsub)((string.gsub)(nil, "([%%%^%$%(%)%.%[%]%+%-])", "%%%1"), "%*", (string.char)(46, 42)), "%?", ".") .. "$") ~= nil then
                            (mp.set_mpattribute)("Lua:InteractivePSUtilityModuleSelector")
                          end
                          do return mp.CLEAN end
                          -- DECOMPILER ERROR at PC485: Confused about usage of register R10 for local variables in 'ReleaseLocals'

                          -- DECOMPILER ERROR: 19 unprocessed JMP targets
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

