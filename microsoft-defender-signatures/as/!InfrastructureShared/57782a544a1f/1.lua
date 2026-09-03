-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\57782a544a1f\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("RPF:TopLevelFile") then
  return mp.CLEAN
end
if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN

