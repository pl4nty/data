-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAVeriatoCertClean\0x00001583_luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true or peattributes.isdll == true then
  (mp.set_mpattribute)("LUA:VeriatoCertClean")
  return mp.INFECTED
end
return mp.CLEAN

