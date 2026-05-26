-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaScriptExecutionFromNewVolumeA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_1 = {}
l_0_1["cmd.exe"] = true
l_0_1["wscript.exe"] = true
l_0_1["cscript.exe"] = true
l_0_1["explorer.exe"] = true
if l_0_0 == nil or l_0_1[l_0_0] ~= true then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(MpCommon.RollingQueueCountNamespaced, "NewVolumeMounted", "Volumes")
if not l_0_3 or not l_0_4 or l_0_4 == 0 then
  return mp.CLEAN
end
local l_0_5, l_0_6 = pcall(MpCommon.RollingQueueQueryKVNamespaced, "NewVolumeMounted", "Volumes")
if l_0_5 and l_0_6 ~= nil then
  for l_0_10,l_0_11 in pairs(l_0_6) do
    if l_0_2:find(l_0_11, 1, true) ~= nil then
      if l_0_0 == "explorer.exe" then
        (mp.set_mpattribute)("Lua:ScriptExecutionFromNewVolume.A!MpDisableCachingSet")
        ;
        (mp.set_mpattribute)("MpDisableCaching")
        return mp.CLEAN
      end
      ;
      (mp.set_mpattribute)("Lua:ScriptExecutionFromNewVolume.A")
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

