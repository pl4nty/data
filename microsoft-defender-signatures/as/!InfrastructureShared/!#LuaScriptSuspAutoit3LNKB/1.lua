-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaScriptSuspAutoit3LNKB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.PathToWin32Path)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_0, "\\microsoft\\windows\\recent", 1, true) then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:ParentProcNameAttr!cmd.exe") and not (mp.get_mpattribute)("Lua:LnkTargetFnameExt!exe") and not (mp.get_mpattribute)("Lua:LnkTargetLastFolder2!appdata") then
  return mp.CLEAN
end
local l_0_1 = (mp.GetLnkInfo)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.BasePath
if l_0_2 ~= nil and #l_0_2 > 1 and IsKeyInRollingQueue("RenamedAutoitPath", (string.lower)(l_0_2), true) then
  return mp.INFECTED
end
return mp.CLEAN

