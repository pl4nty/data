-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15b3a5a91738\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED

