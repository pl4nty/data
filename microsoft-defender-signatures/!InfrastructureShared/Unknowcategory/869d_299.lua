-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\869d_299.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 976800 and (mp.getfilesize)() < 1330584 and (pesecs[5]).Name == "INIT" and (pesecs[5]).Characteristics == 3791650848 then
  return mp.INFECTED
end
return mp.CLEAN

