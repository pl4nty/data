-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaAppWebFile\0x000006e1_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattributesubstring)("Lua:PeOriginalName!app_web_") then
  return mp.CLEAN
end
local l_0_0 = (mp.enum_mpattributesubstring)("Lua:PeOriginalName!app_web_")
if l_0_0 == nil or #l_0_0 == 0 then
  return mp.CLEAN
end
if #l_0_0 == 1 and #l_0_0[#l_0_0] == 39 then
  return mp.INFECTED
end
return mp.CLEAN

