-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9a7802a64\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 4 then
  (mp.changedetectionname)(805306411)
  return mp.INFECTED
end
return mp.SUSPICIOUS

