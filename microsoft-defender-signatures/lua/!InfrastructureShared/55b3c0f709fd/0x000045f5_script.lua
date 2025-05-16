-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b3c0f709fd\0x000045f5_luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED

