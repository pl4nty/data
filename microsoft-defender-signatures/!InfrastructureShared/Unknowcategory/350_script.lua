-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\350_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() >= 4194304 then
  return mp.CLEAN
end
return mp.INFECTED

