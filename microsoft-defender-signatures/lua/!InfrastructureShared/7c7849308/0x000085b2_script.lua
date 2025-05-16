-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7c7849308\0x000085b2_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() < 800000 and (hstrlog[1]).matched and not (hstrlog[2]).matched then
  return mp.INFECTED
end
return mp.CLEAN

