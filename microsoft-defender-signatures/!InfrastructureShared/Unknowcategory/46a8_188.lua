-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\46a8_188.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() >= 4096 and (mp.getfilesize)() <= 5120 then
  return mp.INFECTED
end
return mp.CLEAN

