-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextualDropFileByEmailClient\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(l_0_1)
  if l_0_1 == "outlook.exe" or l_0_1 == "olk.exe" then
    local l_0_2 = "Lua:ContextualDropFileOutlook"
    local l_0_3 = GetSuspiciuousFileType((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME))
    local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH)
    if not l_0_4 then
      return mp.CLEAN
    end
    l_0_4 = (string.lower)(l_0_4)
    if l_0_4:find("\\microsoft\\windows\\inetcache\\content.outlook\\", 1, true) ~= nil or l_0_4:find("\\attachments\\", 1, true) ~= nil or l_0_4:find("\\microsoft\\windows\\inetcache\\ie\\", 1, true) ~= nil or l_0_4:find("%internet_cache%\\content.outlook\\", 1, true) ~= nil then
      l_0_2 = l_0_2 .. "Default"
    else
      l_0_2 = l_0_2 .. "Ext"
    end
    if l_0_3 then
      l_0_2 = l_0_2 .. l_0_3
    else
      l_0_2 = l_0_2 .. "Any"
    end
    ;
    (mp.set_mpattribute)(l_0_2)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

