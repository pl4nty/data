-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8f4f_336.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and peattributes.amd64_image and (pesecs[3]).Name == ".pdata" and (pesecs[4]).Name == ".idata" and (pesecs[5]).Name == "INIT" then
  return mp.INFECTED
end
return mp.CLEAN

