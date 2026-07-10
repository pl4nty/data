-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5d7888f4223c\1.luac 

-- params : ...
-- function num : 0
if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN

