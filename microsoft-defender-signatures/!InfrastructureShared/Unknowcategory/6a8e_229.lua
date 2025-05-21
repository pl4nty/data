-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6a8e_229.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("pea_hasappendeddata") and (mp.getfilesize)() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN

