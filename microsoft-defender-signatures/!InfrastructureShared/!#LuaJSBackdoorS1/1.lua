-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaJSBackdoorS1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("SCRT:BD_JS")
if #l_0_0 >= 3 and #l_0_0 <= 10 then
  (mp.set_mpattribute)("Lua:JS.BD.Bad")
else
  if #l_0_0 == 2 then
    (mp.set_mpattribute)("Lua:JS.BD.Susp")
  end
end
return mp.CLEAN

