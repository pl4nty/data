-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaMytonelF1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0:len() < 14 then
  return mp.CLEAN
end
if l_0_0:sub(-14) ~= "\\pps-qq-19.exe" then
  return mp.CLEAN
end
return mp.INFECTED

