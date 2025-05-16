-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bb78e1707e4e\0x000045a2_luac 

-- params : ...
-- function num : 0
if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN

