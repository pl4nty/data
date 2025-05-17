-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3d3b34f84aff5\1_luac 

-- params : ...
-- function num : 0
if analyzeRansomwarePattern1() == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN

