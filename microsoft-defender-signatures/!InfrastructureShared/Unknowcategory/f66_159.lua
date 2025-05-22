-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\f66_159.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 409600 then
  return mp.CLEAN
end
return mp.INFECTED

