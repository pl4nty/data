-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7c78c9cc1\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
local l_0_0 = (mp.getfilesize)()
if peattributes.isdll and peattributes.amd64_image and (mp.get_mpattribute)("pea_no_security") and l_0_0 > 1048576 and l_0_0 < 2097152 and not (mp.get_mpattribute)("do_exhaustivehstr_64bit_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
end
return mp.CLEAN

