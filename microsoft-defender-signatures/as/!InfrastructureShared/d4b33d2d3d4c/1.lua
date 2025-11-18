-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d4b33d2d3d4c\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[4]).matched or not (this_sigattrlog[4]).utf8p1 or not (this_sigattrlog[4]).utf8p2 then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[4]).utf8p2
if #l_0_0 >= 500 then
  (bm.set_detection_string)((string.lower)(l_0_0))
  return mp.INFECTED
end
return mp.CLEAN

