-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaInteractivePSClassifier\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 <= 0 or l_0_0 > 1000 then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)(l_0_1)
if l_0_2 == nil or type(l_0_2.image_path) ~= "string" then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2.image_path)
if not (string.find)(l_0_3, "explorer.exe", 1, true) and not (string.find)(l_0_3, "windowsterminal.exe", 1, true) and not (string.find)(l_0_3, "wt.exe", 1, true) then
  return mp.CLEAN
end
local l_0_4 = (string.lower)(tostring(headerpage))
if #l_0_4 == 0 then
  return mp.CLEAN
end
local l_0_5 = string.find
do
  if l_0_5(l_0_4, "$", 1, true) ~= nil and (l_0_5(l_0_4, ".", 1, true) ~= nil or l_0_5(l_0_4, "&", 1, true) ~= nil) then
    local l_0_9 = nil
    if (MpCommon.StringRegExpSearch)("(?:^|[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$(?:[a-z_][a-z0-9_]*|\\{(?:(?:global|script|local|private):)?[a-z_][a-z0-9_]*\\}|(?:global|script|local|private):[a-z_][a-z0-9_]*)(?:[ \\t]*\\))?(?:[ \\t]*\\[[^\\]\\r\\n;]+\\])*(?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_4) then
      (mp.set_mpattribute)("Lua:InteractivePSDynamicCalling")
    end
  end
  -- DECOMPILER ERROR at PC188: Confused about usage of register: R6 in 'UnsetPending'

  if l_0_9 and l_0_5(l_0_4, "[", 1, true) ~= nil and l_0_5(l_0_4, "]", 1, true) ~= nil then
    local l_0_26 = nil
    -- DECOMPILER ERROR at PC214: Overwrote pending register: R10 in 'AssignReg'

    do
      do
        if (not l_0_5(l_0_4, "gcm", 1, true) ~= nil or l_0_5(l_0_4, "get-command", 1, true) ~= nil or false or not (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*\\(?\\s*(?:gcm|get-command)\\b[^\\r\\n;|]*?\\)?\\s*\\.\\s*name\\b[^\\r\\n]{0,768}?(?:[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$\\1(?:[ \\t]*\\))?[ \\t]*\\[[ \\t]*[^\\]\\r\\n;]+[ \\t]*\\](?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_4)) and (l_0_5(l_0_4, "gmo", 1, true) ~= nil or l_0_5(l_0_4, "get-module", 1, true) ~= nil or l_0_5(l_0_4, "ipmo", 1, true) ~= nil or l_0_5(l_0_4, "import-module", 1, true) ~= nil) then
          local l_0_27 = nil
          -- DECOMPILER ERROR at PC259: Confused about usage of register: R8 in 'UnsetPending'

          -- DECOMPILER ERROR at PC277: Confused about usage of register: R9 in 'UnsetPending'

        end
        -- DECOMPILER ERROR at PC306: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC306: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC306: Unhandled construct in 'MakeBoolean' P3

        if l_0_5((string.gsub)(l_0_4, "[%s\'\"%+]", ""), "exportedcommands", 1, true) == nil or ((l_0_5(l_0_4, "gmo", 1, true) ~= nil or l_0_5(l_0_4, "get-module", 1, true) ~= nil and not (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:gmo|get-module)\\b[^\\r\\n]{0,768}?\\$[a-z_][a-z0-9_]*\\s*=\\s*\\$\\1\\s*\\[\\s*[^\\]\\r\\n;]+\\s*\\]", l_0_4) and (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:gmo|get-module)\\b[^\\r\\n]{0,768}?(?:[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$\\1(?:[ \\t]*\\))?[ \\t]*\\[[ \\t]*[^\\]\\r\\n;]+[ \\t]*\\](?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_4)) or (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:ipmo|import-module)\\b(?=[^;\\r\\n|]*?\\s-pa(?:s(?:s(?:t(?:h(?:r(?:u)?)?)?)?)?)?\\b)[^\\r\\n]{0,768}?(?:[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$\\1(?:[ \\t]*\\))?[ \\t]*\\[[ \\t]*[^\\]\\r\\n;]+[ \\t]*\\](?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_4)) then
          (mp.set_mpattribute)("Lua:InteractivePSCommandIndexing")
        end
        -- DECOMPILER ERROR at PC307: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC309: Confused about usage of register: R8 in 'UnsetPending'

        -- DECOMPILER ERROR at PC311: Confused about usage of register: R9 in 'UnsetPending'

        if not l_0_27 and not l_0_5(l_0_4, "gmo", 1, true) ~= nil or l_0_5(l_0_4, "get-module", 1, true) ~= nil and not l_0_5(l_0_4, "ipmo", 1, true) ~= nil or l_0_5(l_0_4, "import-module", 1, true) ~= nil then
          return mp.CLEAN
        end
        local l_0_43 = nil
        local l_0_44 = nil
        do
          if l_0_44 then
            local l_0_45 = nil
            -- DECOMPILER ERROR at PC326: Overwrote pending register: R11 in 'AssignReg'

            -- DECOMPILER ERROR at PC328: Overwrote pending register: R10 in 'AssignReg'

          end
          -- DECOMPILER ERROR at PC331: Confused about usage of register: R8 in 'UnsetPending'

          do
            if not false and l_0_45 then
              local l_0_46 = nil
              -- DECOMPILER ERROR at PC339: Overwrote pending register: R11 in 'AssignReg'

            end
            -- DECOMPILER ERROR at PC344: Confused about usage of register: R9 in 'UnsetPending'

            do
              if not (MpCommon.StringRegExpSearch)("(?:\\bgmo\\b|\\bget-module\\b)(?:[^;\\r\\n|]*?\\s-n(?:a(?:m(?:e)?)?)?(?:\\s+|:\\s*)|\\s+)([\'\"]?)((?!-)[^\'\"\\s;|),]+)\\1", l_0_4) and l_0_5(l_0_4, "ipmo", 1, true) ~= nil or l_0_5(l_0_4, "import-module", 1, true) ~= nil then
                local l_0_47 = nil
                -- DECOMPILER ERROR at PC352: Overwrote pending register: R11 in 'AssignReg'

              end
              if not (MpCommon.StringRegExpSearch)("(?:\\bipmo\\b|\\bimport-module\\b)(?:[^;\\r\\n|]*?\\s-n(?:a(?:m(?:e)?)?)?(?:\\s+|:\\s*)|\\s+)([\'\"]?)((?!-)[^\'\"\\s;|),]+)\\1", l_0_4) then
                return mp.CLEAN
              end
              local l_0_48 = nil
              if nil == "microsoft.powershell.utility" then
                (mp.set_mpattribute)("Lua:InteractivePSUtilityModuleSelector")
                return mp.CLEAN
              end
              -- DECOMPILER ERROR at PC371: Confused about usage of register: R11 in 'UnsetPending'

              -- DECOMPILER ERROR at PC379: Confused about usage of register: R11 in 'UnsetPending'

              if l_0_5(nil, "*", 1, true) == nil and l_0_5(nil, "?", 1, true) == nil then
                return mp.CLEAN
              end
              -- DECOMPILER ERROR at PC391: Confused about usage of register: R11 in 'UnsetPending'

              do
                local l_0_49 = nil
                -- DECOMPILER ERROR at PC419: Confused about usage of register: R12 in 'UnsetPending'

                if (string.match)("microsoft.powershell.utility", "^" .. (string.gsub)((string.gsub)((string.gsub)(nil, "([%%%^%$%(%)%.%[%]%+%-])", "%%%1"), "%*", (string.char)(46, 42)), "%?", ".") .. "$") ~= nil then
                  (mp.set_mpattribute)("Lua:InteractivePSUtilityModuleSelector")
                end
                do return mp.CLEAN end
                -- DECOMPILER ERROR: 19 unprocessed JMP targets
              end
            end
          end
        end
      end
    end
  end
end

