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
  if l_0_5 <= 0 or l_0_5 > 1000 then
    return mp.CLEAN
  end
  local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_6 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

  local l_0_7 = (mp.GetParentProcInfo)("powershell.exe")
  -- DECOMPILER ERROR at PC59: Overwrote pending register: R6 in 'AssignReg'

  if l_0_7 == nil or type("pwsh.exe") ~= "string" then
    return mp.CLEAN
  end
  local l_0_8 = (string.lower)(l_0_7.image_path)
  local l_0_9 = (string.find)(l_0_8, "explorer.exe", 1, true)
  if l_0_9 then
    (mp.set_mpattribute)("Lua:MpPowershellAmsiViaCmdLinePPExplorer")
  end
  if not l_0_9 and not (string.find)(l_0_8, "windowsterminal.exe", 1, true) and not (string.find)(l_0_8, "wt.exe", 1, true) then
    return mp.CLEAN
  end
  local l_0_10 = (string.lower)(tostring(headerpage))
  if #l_0_10 == 0 then
    return mp.CLEAN
  end
  local l_0_11 = string.find
  do
    if l_0_11(l_0_10, "$", 1, true) ~= nil and (l_0_11(l_0_10, ".", 1, true) ~= nil or l_0_11(l_0_10, "&", 1, true) ~= nil) then
      local l_0_15 = nil
      if (MpCommon.StringRegExpSearch)("(?:^|[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$(?:[a-z_][a-z0-9_]*|\\{(?:(?:global|script|local|private):)?[a-z_][a-z0-9_]*\\}|(?:global|script|local|private):[a-z_][a-z0-9_]*)(?:[ \\t]*\\))?(?:[ \\t]*\\[[^\\]\\r\\n;]+\\])*(?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_10) then
        (mp.set_mpattribute)("Lua:InteractivePSDynamicCalling")
      end
    end
    -- DECOMPILER ERROR at PC214: Confused about usage of register: R9 in 'UnsetPending'

    if l_0_15 and l_0_11(l_0_10, "[", 1, true) ~= nil and l_0_11(l_0_10, "]", 1, true) ~= nil then
      local l_0_32 = nil
      -- DECOMPILER ERROR at PC240: Overwrote pending register: R13 in 'AssignReg'

      do
        do
          if (not l_0_11(l_0_10, "gcm", 1, true) ~= nil or l_0_11(l_0_10, "get-command", 1, true) ~= nil or false or not (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*\\(?\\s*(?:gcm|get-command)\\b[^\\r\\n;|]*?\\)?\\s*\\.\\s*name\\b[^\\r\\n]{0,768}?(?:[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$\\1(?:[ \\t]*\\))?[ \\t]*\\[[ \\t]*[^\\]\\r\\n;]+[ \\t]*\\](?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_10)) and (l_0_11(l_0_10, "gmo", 1, true) ~= nil or l_0_11(l_0_10, "get-module", 1, true) ~= nil or l_0_11(l_0_10, "ipmo", 1, true) ~= nil or l_0_11(l_0_10, "import-module", 1, true) ~= nil) then
            local l_0_33 = nil
            -- DECOMPILER ERROR at PC285: Confused about usage of register: R11 in 'UnsetPending'

            -- DECOMPILER ERROR at PC303: Confused about usage of register: R12 in 'UnsetPending'

          end
          -- DECOMPILER ERROR at PC332: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC332: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC332: Unhandled construct in 'MakeBoolean' P3

          if l_0_11((string.gsub)(l_0_10, "[%s\'\"%+]", ""), "exportedcommands", 1, true) == nil or ((l_0_11(l_0_10, "gmo", 1, true) ~= nil or l_0_11(l_0_10, "get-module", 1, true) ~= nil and not (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:gmo|get-module)\\b[^\\r\\n]{0,768}?\\$[a-z_][a-z0-9_]*\\s*=\\s*\\$\\1\\s*\\[\\s*[^\\]\\r\\n;]+\\s*\\]", l_0_10) and (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:gmo|get-module)\\b[^\\r\\n]{0,768}?(?:[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$\\1(?:[ \\t]*\\))?[ \\t]*\\[[ \\t]*[^\\]\\r\\n;]+[ \\t]*\\](?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_10)) or (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:ipmo|import-module)\\b(?=[^;\\r\\n|]*?\\s-pa(?:s(?:s(?:t(?:h(?:r(?:u)?)?)?)?)?)?\\b)[^\\r\\n]{0,768}?(?:[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$\\1(?:[ \\t]*\\))?[ \\t]*\\[[ \\t]*[^\\]\\r\\n;]+[ \\t]*\\](?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_10)) then
            (mp.set_mpattribute)("Lua:InteractivePSCommandIndexing")
          end
          -- DECOMPILER ERROR at PC333: Confused about usage of register: R10 in 'UnsetPending'

          -- DECOMPILER ERROR at PC335: Confused about usage of register: R11 in 'UnsetPending'

          -- DECOMPILER ERROR at PC337: Confused about usage of register: R12 in 'UnsetPending'

          if not l_0_33 and not l_0_11(l_0_10, "gmo", 1, true) ~= nil or l_0_11(l_0_10, "get-module", 1, true) ~= nil and not l_0_11(l_0_10, "ipmo", 1, true) ~= nil or l_0_11(l_0_10, "import-module", 1, true) ~= nil then
            return mp.CLEAN
          end
          local l_0_49 = nil
          local l_0_50 = nil
          do
            if l_0_50 then
              local l_0_51 = nil
              -- DECOMPILER ERROR at PC352: Overwrote pending register: R14 in 'AssignReg'

              -- DECOMPILER ERROR at PC354: Overwrote pending register: R13 in 'AssignReg'

            end
            -- DECOMPILER ERROR at PC357: Confused about usage of register: R11 in 'UnsetPending'

            do
              if not false and l_0_51 then
                local l_0_52 = nil
                -- DECOMPILER ERROR at PC365: Overwrote pending register: R14 in 'AssignReg'

              end
              -- DECOMPILER ERROR at PC370: Confused about usage of register: R12 in 'UnsetPending'

              do
                if not (MpCommon.StringRegExpSearch)("(?:\\bgmo\\b|\\bget-module\\b)(?:[^;\\r\\n|]*?\\s-n(?:a(?:m(?:e)?)?)?(?:\\s+|:\\s*)|\\s+)([\'\"]?)((?!-)[^\'\"\\s;|),]+)\\1", l_0_10) and l_0_11(l_0_10, "ipmo", 1, true) ~= nil or l_0_11(l_0_10, "import-module", 1, true) ~= nil then
                  local l_0_53 = nil
                  -- DECOMPILER ERROR at PC378: Overwrote pending register: R14 in 'AssignReg'

                end
                if not (MpCommon.StringRegExpSearch)("(?:\\bipmo\\b|\\bimport-module\\b)(?:[^;\\r\\n|]*?\\s-n(?:a(?:m(?:e)?)?)?(?:\\s+|:\\s*)|\\s+)([\'\"]?)((?!-)[^\'\"\\s;|),]+)\\1", l_0_10) then
                  return mp.CLEAN
                end
                local l_0_54 = nil
                if nil == "microsoft.powershell.utility" then
                  (mp.set_mpattribute)("Lua:InteractivePSUtilityModuleSelector")
                  return mp.CLEAN
                end
                -- DECOMPILER ERROR at PC397: Confused about usage of register: R14 in 'UnsetPending'

                -- DECOMPILER ERROR at PC405: Confused about usage of register: R14 in 'UnsetPending'

                if l_0_11(nil, "*", 1, true) == nil and l_0_11(nil, "?", 1, true) == nil then
                  return mp.CLEAN
                end
                -- DECOMPILER ERROR at PC417: Confused about usage of register: R14 in 'UnsetPending'

                do
                  local l_0_55 = nil
                  -- DECOMPILER ERROR at PC445: Confused about usage of register: R15 in 'UnsetPending'

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
end

