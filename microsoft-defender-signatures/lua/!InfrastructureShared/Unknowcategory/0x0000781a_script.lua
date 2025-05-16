-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000781a_luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and (pe.get_exports_count)() == 1 then
  return mp.INFECTED
end
return mp.CLEAN

