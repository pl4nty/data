-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93b3_341.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC27: Unhandled construct in 'MakeBoolean' P3

if (peattributes.amd64_image and (pesecs[pehdr.NumberOfSections]).Characteristics == 3758096448) or (pesecs[pehdr.NumberOfSections]).Characteristics == 3761242176 then
  return mp.INFECTED
end
return mp.CLEAN

