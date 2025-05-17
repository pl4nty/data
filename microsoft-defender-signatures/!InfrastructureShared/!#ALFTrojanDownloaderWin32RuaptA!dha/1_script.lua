-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanDownloaderWin32RuaptA!dha\1_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() == 42496 then
  return mp.INFECTED
end
return mp.CLEAN

