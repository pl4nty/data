-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4078d17c2\1.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 3145728 then
  return mp.CLEAN
end
if peattributes.x86_image and not (mp.get_mpattribute)("do_exhaustivehstr_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_rescan")
end
if peattributes.amd64_image and not (mp.get_mpattribute)("do_exhaustivehstr_64bit_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
end
if mp.HSTR_WEIGHT >= 12 then
  return mp.INFECTED
end
return mp.CLEAN

