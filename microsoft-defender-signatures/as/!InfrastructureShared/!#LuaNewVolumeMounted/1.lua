-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaNewVolumeMounted\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMOUNT then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_1:find("harddiskvolume", 1, true) then
  AppendToRollingQueueNamespaced("NewVolumeMounted", "Volumes", "volume", l_0_1, 120)
end
return mp.CLEAN

