-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaScriptSuspAutoit3LNKA\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:LnkTargetFnameExt!bat") and not (mp.get_mpattribute)("Lua:LnkTargetFnameExt!scr") and not (mp.get_mpattribute)("Lua:LnkTargetFnameExt!pif") and not (mp.get_mpattribute)("Lua:LnkTargetFnameExt!com") then
  return mp.CLEAN
end
local l_0_0 = (mp.GetLnkInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.BasePath
if l_0_1 ~= nil and #l_0_1 > 1 and IsKeyInRollingQueue("RenamedAutoitPath", (string.lower)(l_0_1), true) then
  return mp.INFECTED
end
return mp.CLEAN

