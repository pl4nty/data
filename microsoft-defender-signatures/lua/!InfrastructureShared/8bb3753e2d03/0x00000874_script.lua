-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8bb3753e2d03\0x00000874_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_connection_string)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (string.match)(l_0_0, "Uri=([^;]*);")
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if (string.match)(l_0_1, "://([^/:]+%.kr)/") == nil then
  return mp.CLEAN
end
return mp.INFECTED

