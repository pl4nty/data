-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\753e_262.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true or peattributes.isdll == true and (mp.getfilesize)() <= 35463936 and (mp.getfilesize)() >= 25463936 then
  return mp.INFECTED
end
return mp.CLEAN

