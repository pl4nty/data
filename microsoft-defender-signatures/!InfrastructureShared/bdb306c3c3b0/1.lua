-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bdb306c3c3b0\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[3]).utf8p2 == (this_sigattrlog[3]).utf8p1 then
  return mp.INFECTED
end
return mp.CLEAN

