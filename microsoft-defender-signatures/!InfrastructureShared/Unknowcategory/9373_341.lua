-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9373_341.luac 

-- params : ...
-- function num : 0
if not peattributes.isdll or not (mp.get_mpattribute)("BM_UnsignedDll") or (mp.getfilesize)() > 1048576 then
  return mp.CLEAN
end
if (pe.get_exports_count)() > 2 then
  return mp.CLEAN
end
return mp.INFECTED

