-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e6b3a49fc3b3\1.luac 

-- params : ...
-- function num : 0
if (mp.IsKnownFriendlyFile)((bm.get_imagepath)(), false, false) == true then
  return mp.CLEAN
end
return mp.INFECTED

