-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7e78cc3de\0x00004588_luac 

-- params : ...
-- function num : 0
if peattributes.isdriver then
  return mp.INFECTED
end
return mp.CLEAN

