-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00009d74_luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true or peattributes.isdll == true and (pesecs[4]).Name == ".ndata" and (pesecs[3]).Characteristics == 3221225600 then
  return mp.INFECTED
end
return mp.CLEAN

