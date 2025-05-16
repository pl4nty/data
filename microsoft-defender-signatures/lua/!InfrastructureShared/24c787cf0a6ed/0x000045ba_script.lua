-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\24c787cf0a6ed\0x000045ba_luac 

-- params : ...
-- function num : 0
if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN

