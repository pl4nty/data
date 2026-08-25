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
local l_0_4 = (string.find)(l_0_3, "explorer.exe", 1, true)
if l_0_4 then
  (mp.set_mpattribute)("Lua:MpPowershellAmsiViaCmdLinePPExplorer")
end
if not l_0_4 and not (string.find)(l_0_3, "windowsterminal.exe", 1, true) and not (string.find)(l_0_3, "wt.exe", 1, true) then
  return mp.CLEAN
end
local l_0_5 = (string.lower)((mp.GetProcessCommandLine)(l_0_1))
if l_0_5 ~= nil then
  local l_0_6 = contains
  local l_0_7 = l_0_5
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC101: No list found for R8 , SetList fails

end
-- DECOMPILER ERROR at PC105: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC106: Overwrote pending register: R6 in 'AssignReg'

if l_0_6 then
  return l_0_6
end
-- DECOMPILER ERROR at PC108: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC109: Overwrote pending register: R6 in 'AssignReg'

local l_0_9 = ".ps1"
if #l_0_6 == 0 then
  return mp.CLEAN
end
local l_0_10 = ".psd1"
-- DECOMPILER ERROR at PC125: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC134: Confused about usage of register: R7 in 'UnsetPending'

-- DECOMPILER ERROR at PC134: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC135: Overwrote pending register: R10 in 'AssignReg'

if (string.find)(l_0_9, l_0_10, ".psm1", true) ~= nil then
  l_0_9 = l_0_9(l_0_10, ".", 1, true)
  -- DECOMPILER ERROR at PC142: Confused about usage of register: R7 in 'UnsetPending'

  if l_0_9 == nil then
    l_0_9 = string.find
    -- DECOMPILER ERROR at PC143: Overwrote pending register: R10 in 'AssignReg'

    l_0_9 = l_0_9(l_0_10, "&", 1, true)
  end
  if l_0_9 ~= nil then
    l_0_9 = "(?:^|[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$(?:[a-z_][a-z0-9_]*|\\{(?:(?:global|script|local|private):)?[a-z_][a-z0-9_]*\\}|(?:global|script|local|private):[a-z_][a-z0-9_]*)(?:[ \\t]*\\))?(?:[ \\t]*\\[[^\\]\\r\\n;]+\\])*(?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)"
    local l_0_14 = nil
    -- DECOMPILER ERROR at PC151: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC152: Overwrote pending register: R10 in 'AssignReg'

    l_0_14 = l_0_9
    l_0_10 = l_0_10(l_0_14, l_0_6)
    if l_0_10 then
      l_0_10 = mp
      l_0_10 = l_0_10.set_mpattribute
      l_0_14 = "Lua:InteractivePSDynamicCalling"
      l_0_10(l_0_14)
    end
  end
end
-- DECOMPILER ERROR at PC162: Confused about usage of register: R7 in 'UnsetPending'

l_0_9 = string.find
l_0_10 = l_0_6
l_0_9 = l_0_9(l_0_10, "gcm", 1, true)
-- DECOMPILER ERROR at PC170: Confused about usage of register: R7 in 'UnsetPending'

if l_0_9 == nil then
  l_0_9 = string.find
  l_0_10 = l_0_6
  l_0_9 = l_0_9(l_0_10, "get-command", 1, true)
  l_0_9 = l_0_9 ~= nil
  -- DECOMPILER ERROR at PC180: Confused about usage of register: R7 in 'UnsetPending'

  l_0_10 = string.find
  l_0_10 = l_0_10(l_0_6, "gmo", 1, true)
  -- DECOMPILER ERROR at PC188: Confused about usage of register: R7 in 'UnsetPending'

  if l_0_10 == nil then
    l_0_10 = string.find
    l_0_10 = l_0_10(l_0_6, "get-module", 1, true)
    l_0_10 = l_0_10 ~= nil
    -- DECOMPILER ERROR at PC198: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC206: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC216: Confused about usage of register: R8 in 'UnsetPending'

    -- DECOMPILER ERROR at PC218: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC226: Confused about usage of register: R7 in 'UnsetPending'

    if (string.find)(l_0_9, l_0_10, ".psm1", true) ~= nil and (string.find)(l_0_6, "[", 1, true) ~= nil and (string.find)(l_0_6, "]", 1, true) ~= nil then
      local l_0_31 = (string.find)(l_0_6, "ipmo", 1, true) ~= nil or (string.find)(l_0_6, "import-module", 1, true) ~= nil
      -- DECOMPILER ERROR at PC242: Overwrote pending register: R12 in 'AssignReg'

      do
        do
          if (not l_0_9 or false or not (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*\\(?\\s*(?:gcm|get-command)\\b[^\\r\\n;|]*?\\)?\\s*\\.\\s*name\\b[^\\r\\n]{0,768}?(?:[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$\\1(?:[ \\t]*\\))?[ \\t]*\\[[ \\t]*[^\\]\\r\\n;]+[ \\t]*\\](?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_6)) and (l_0_10 or l_0_31) then
            local l_0_32 = nil
            -- DECOMPILER ERROR at PC263: Confused about usage of register: R7 in 'UnsetPending'

            -- DECOMPILER ERROR at PC271: Confused about usage of register: R7 in 'UnsetPending'

            -- DECOMPILER ERROR at PC279: Confused about usage of register: R7 in 'UnsetPending'

            if (string.find)((string.gsub)(l_0_6, "[%s\'\"%+]", ""), "exportedcommands", 1, true) ~= nil and (string.find)((string.gsub)(l_0_6, "[%s\'\"%+]", ""), "values", 1, true) ~= nil and (string.find)((string.gsub)(l_0_6, "[%s\'\"%+]", ""), "name", 1, true) ~= nil then
              if l_0_10 then
                l_0_32 = (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:gmo|get-module)\\b[^\\r\\n]{0,768}?\\$[a-z_][a-z0-9_]*\\s*=\\s*\\$\\1\\s*\\[\\s*[^\\]\\r\\n;]+\\s*\\]", l_0_6)
                if not l_0_32 then
                  l_0_32 = (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:gmo|get-module)\\b[^\\r\\n]{0,768}?(?:[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$\\1(?:[ \\t]*\\))?[ \\t]*\\[[ \\t]*[^\\]\\r\\n;]+[ \\t]*\\](?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_6)
                end
              end
              -- DECOMPILER ERROR at PC307: Confused about usage of register: R7 in 'UnsetPending'

              if not l_0_32 and l_0_31 and (string.find)(l_0_6, "-pa", 1, true) ~= nil then
                l_0_32 = (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:ipmo|import-module)\\b(?=[^;\\r\\n|]*?\\s-pa(?:s(?:s(?:t(?:h(?:r(?:u)?)?)?)?)?)?\\b)[^\\r\\n]{0,768}?\\$[a-z_][a-z0-9_]*\\s*=\\s*\\$\\1\\s*\\[\\s*[^\\]\\r\\n;]+\\s*\\]", l_0_6)
                if not l_0_32 then
                  l_0_32 = (MpCommon.StringRegExpSearch)("\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:ipmo|import-module)\\b(?=[^;\\r\\n|]*?\\s-pa(?:s(?:s(?:t(?:h(?:r(?:u)?)?)?)?)?)?\\b)[^\\r\\n]{0,768}?(?:[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$\\1(?:[ \\t]*\\))?[ \\t]*\\[[ \\t]*[^\\]\\r\\n;]+[ \\t]*\\](?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)", l_0_6)
                end
              end
            end
          end
          -- DECOMPILER ERROR at PC329: Confused about usage of register: R12 in 'UnsetPending'

          if l_0_32 then
            (mp.set_mpattribute)("Lua:InteractivePSCommandIndexing")
          end
          -- DECOMPILER ERROR at PC339: Confused about usage of register: R11 in 'UnsetPending'

          if not l_0_9 and not l_0_10 and not l_0_31 then
            return mp.CLEAN
          end
          local l_0_48 = nil
          local l_0_49 = false
          do
            if l_0_9 then
              local l_0_50 = nil
              l_0_49 = (MpCommon.StringRegExpSearch)("(?:\\bgcm\\b|\\bget-command\\b)[^;\\r\\n|]*?\\s-(?:m(?:o(?:d(?:u(?:l(?:e)?)?)?)?)?|ps(?:s(?:n(?:a(?:p(?:i(?:n)?)?)?)?)?)?)(?:\\s+|:\\s*)([\'\"]?)([^\'\"\\s;|),]+)\\1", l_0_6)
            end
            do
              if not l_0_49 and l_0_10 then
                local l_0_51 = l_0_50
                l_0_49 = (MpCommon.StringRegExpSearch)("(?:\\bgmo\\b|\\bget-module\\b)(?:[^;\\r\\n|]*?\\s-n(?:a(?:m(?:e)?)?)?(?:\\s+|:\\s*)|\\s+)([\'\"]?)((?!-)[^\'\"\\s;|),]+)\\1", l_0_6)
              end
              do
                if not l_0_49 and l_0_48 then
                  local l_0_52 = l_0_51
                  l_0_49 = (MpCommon.StringRegExpSearch)("(?:\\bipmo\\b|\\bimport-module\\b)(?:[^;\\r\\n|]*?\\s-n(?:a(?:m(?:e)?)?)?(?:\\s+|:\\s*)|\\s+)([\'\"]?)((?!-)[^\'\"\\s;|),]+)\\1", l_0_6)
                end
                if not l_0_49 then
                  return mp.CLEAN
                end
                local l_0_53 = l_0_52
                if l_0_53 == "microsoft.powershell.utility" then
                  (mp.set_mpattribute)("Lua:InteractivePSUtilityModuleSelector")
                  return mp.CLEAN
                end
                -- DECOMPILER ERROR at PC398: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC406: Confused about usage of register: R7 in 'UnsetPending'

                if (string.find)(l_0_53, "*", 1, true) == nil and (string.find)(l_0_53, "?", 1, true) == nil then
                  return mp.CLEAN
                end
                do
                  local l_0_54 = nil
                  if (string.match)(l_0_54, "^" .. (string.gsub)((string.gsub)((string.gsub)(l_0_53, "([%%%^%$%(%)%.%[%]%+%-])", "%%%1"), "%*", (string.char)(46, 42)), "%?", ".") .. "$") ~= nil then
                    (mp.set_mpattribute)("Lua:InteractivePSUtilityModuleSelector")
                  end
                  do return mp.CLEAN end
                  -- DECOMPILER ERROR at PC459: Confused about usage of register R8 for local variables in 'ReleaseLocals'

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

