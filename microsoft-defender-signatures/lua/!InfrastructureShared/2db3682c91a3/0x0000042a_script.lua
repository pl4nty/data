-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2db3682c91a3\0x0000042a_luac 

-- params : ...
-- function num : 0
local l_0_0 = (this_sigattrlog[2]).utf8p2
local l_0_1 = (string.find)(l_0_0, "Bytes:", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0:sub(l_0_1)
local l_0_3 = l_0_2:match("Bytes:(%d+)")
if l_0_3 and #l_0_3 > 6 then
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN

