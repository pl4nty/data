-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanScriptSuspDownSC\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 then
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_3 and l_0_4 ~= nil and (string.find)(l_0_4, "\\powershell.exe", 1, true) then
      local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
      if not l_0_5 then
        return mp.CLEAN
      end
      local l_0_6 = (string.lower)((mp.GetProcessCommandLine)(l_0_5))
      if #l_0_6 < 70 then
        return mp.CLEAN
      end
      if not (string.find)(l_0_6, "http", 1, true) then
        return mp.CLEAN
      end
      local l_0_7, l_0_8 = (MpCommon.StringRegExpSearch)("(https?:\\/\\/[^^\\s\\x22\\x27\\x7C\\x29\\x3B\\x3E\\x3C\\x2C\\x5E\\x60\\x5D\\x7D]+)", l_0_6)
      if not l_0_7 then
        return mp.CLEAN
      end
      if not l_0_8 then
        return mp.CLEAN
      end
      local l_0_9 = ExtractPartsFromUri(l_0_8)
      if l_0_9 == "" or l_0_9 == nil then
        return mp.CLEAN
      end
      if l_0_9.host == "" or l_0_9.host == nil then
        return mp.CLEAN
      end
      local l_0_10 = split(l_0_9.host, "%.")
      if not l_0_10 then
        return mp.CLEAN
      end
      local l_0_11 = "." .. tostring(l_0_10[#l_0_10])
      if not l_0_11 then
        return mp.CLEAN
      end
      if not isSuspTLD(l_0_11) then
        return mp.CLEAN
      end
      local l_0_12 = (mp.GetParentProcInfo)(l_0_5)
      if l_0_12 ~= nil and l_0_12.image_path ~= nil then
        local l_0_13 = (string.lower)(l_0_12.image_path)
        local l_0_14 = l_0_13:match("([^\\]+)$")
        local l_0_15 = {}
        l_0_15["explorer.exe"] = true
        if l_0_15[l_0_14] then
          return mp.INFECTED
        end
      end
    end
  end
end
do
  return mp.CLEAN
end

