-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9b7879dfb\1.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 30000 and (mp.getfilesize)() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN

