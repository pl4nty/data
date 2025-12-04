-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3f7874cff9d2\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("RPF:TopLevelFile") and candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN

