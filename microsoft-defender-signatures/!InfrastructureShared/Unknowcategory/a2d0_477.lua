-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a2d0_477.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("pea_hasexports") and (mp.getfilesize)() > 20000000 then
  if peattributes.x86_image and not (mp.get_mpattribute)("do_exhaustivehstr_rescan") then
    (mp.set_mpattribute)("do_exhaustivehstr_rescan")
  end
  if peattributes.amd64_image and not (mp.get_mpattribute)("do_exhaustivehstr_64bit_rescan") then
    (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
  end
  return mp.INFECTED
end
return mp.CLEAN

