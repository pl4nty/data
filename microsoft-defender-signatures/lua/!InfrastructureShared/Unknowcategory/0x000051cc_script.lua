-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000051cc_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 30720 and (mp.getfilesize)() < 849920 then
  return mp.INFECTED
end
return mp.CLEAN

