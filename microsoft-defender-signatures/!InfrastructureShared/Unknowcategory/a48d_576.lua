-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a48d_576.luac 

-- params : ...
-- function num : 0
if not peattributes.isdll or not (mp.get_mpattribute)("BM_UnsignedDll") or (mp.getfilesize)() > 1048576 then
  return mp.CLEAN
end
if peattributes.x86_image and not (mp.get_mpattribute)("do_exhaustivehstr_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_rescan")
end
if peattributes.amd64_image and not (mp.get_mpattribute)("do_exhaustivehstr_64bit_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
end
if (pe.get_exports_count)() > 3 then
  return mp.CLEAN
end
return mp.INFECTED

