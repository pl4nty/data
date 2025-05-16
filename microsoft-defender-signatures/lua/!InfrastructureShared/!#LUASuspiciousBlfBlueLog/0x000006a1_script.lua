-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUASuspiciousBlfBlueLog\0x000006a1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 2048 or l_0_0 > 65536 then
  return mp.CLEAN
end
local l_0_1 = (mp.readheader)(2048, 4)
if l_0_1 ~= "\021\000\021\000" then
  return mp.CLEAN
end
local l_0_2 = (mp.readheader)(2088, 4)
if l_0_2 ~= "\214\000\000\000" then
  return mp.CLEAN
end
local l_0_3 = (mp.readheader)(3070, 4)
if l_0_3 ~= "\016\021\000\000" then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("BM_SUSP_BLF_BLUELOG")
return mp.INFECTED

