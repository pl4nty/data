-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9a1a_luac 

-- params : ...
-- function num : 0
if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
if (pe.get_exports)() == 1 and (pe.mmap_string_rva)((R1_PC21[1]).namerva, 64) == "RegisterModule" then
  return mp.INFECTED
end
return mp.CLEAN

