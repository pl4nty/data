-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaAmsiAppContextDataJScriptHttpA\1_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattributesubstring)("Lua:AmsiAppContextData:File:http") then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 then
  l_0_0 = l_0_0:match("([^\\]+)$")
  if l_0_0 then
    l_0_0 = (string.lower)(l_0_0:gsub("%s", "/x20"))
    ;
    (mp.set_mpattribute)("Lua:AmsiAppContextDataJScriptHttp:Proc:" .. l_0_0)
  end
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_1 then
  local l_0_2 = (mp.GetParentProcInfo)(l_0_1)
  if l_0_2 then
    local l_0_3 = l_0_2.image_path
    l_0_3 = l_0_3:match("([^\\]+)$")
    if l_0_3 then
      l_0_3 = (string.lower)(l_0_3:gsub("%s", "/x20"))
      ;
      (mp.set_mpattribute)("Lua:AmsiAppContextDataJScriptHttp:Parent:" .. l_0_3)
    end
  end
end
do
  local l_0_4 = (mp.enum_mpattributesubstring)("Lua:AmsiAppContextData:File:http")
  do
    if not (l_0_4[1]):match("https?://[%w%.%-]+%.([%w%.]+)/") then
      local l_0_5, l_0_6, l_0_7, l_0_9, l_0_11 = l_0_4 == nil or #l_0_4 == 0 or ""
    end
    -- DECOMPILER ERROR at PC86: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC93: Confused about usage of register: R3 in 'UnsetPending'

    if l_0_5 ~= "" then
      (mp.set_mpattribute)("Lua:AmsiAppContextDataHttp:TLD:" .. (string.lower)(l_0_5))
      do
        local l_0_8, l_0_10 = , (l_0_4[1]):match("%.([%w]+)$") or ""
        -- DECOMPILER ERROR at PC104: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC111: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_10 ~= "" then
          (mp.set_mpattribute)("Lua:AmsiAppContextDataHttp:FileExt:" .. (string.lower)(l_0_10))
        end
        if l_0_0 == "mshta.exe" then
          for l_0_15,l_0_16 in ipairs(l_0_4) do
            local l_0_12 = nil
            -- DECOMPILER ERROR at PC123: Confused about usage of register: R8 in 'UnsetPending'

            -- DECOMPILER ERROR at PC130: Confused about usage of register: R8 in 'UnsetPending'

            if not (string.find)(l_0_10, "%.hta$") and not (string.find)(l_0_10, "%.html$") then
              (mp.set_mpattribute)("Lua:AmsiAppContextDataJScriptHttpNonHTA")
              break
            end
          end
        end
        do
          return mp.INFECTED
        end
      end
    end
  end
end

