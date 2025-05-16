-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00009b0f_luac 

-- params : ...
-- function num : 0
if peattributes.isexe and (pesecs[8]).Name == ".rsrc" and (pesecs[8]).SizeOfRawData > 2228224 and (pesecs[8]).SizeOfRawData < 2293760 then
  return mp.INFECTED
end
return mp.CLEAN

