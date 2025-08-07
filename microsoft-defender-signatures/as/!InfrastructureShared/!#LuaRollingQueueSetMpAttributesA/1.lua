-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaRollingQueueSetMpAttributesA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or #l_0_0 <= 4 then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(normalize_path(l_0_0))
if l_0_1 == nil then
  return mp.CLEAN
end
if IsKeyInRollingQueue("UrlFileInStartupTargetA", l_0_1, true) then
  (mp.set_mpattribute)("Lua:UrlFileInStartupTarget.A")
end
return mp.CLEAN

