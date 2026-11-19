-- Threat: !InfrastructureShared
-- Name: !#chromecrxpackage
-- Type: 13

local l_0_0 = mp.getfilesize()
if l_0_0 < 256 or 1048576 < l_0_0 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 875721283 or mp.readu_u32(headerpage, 5) ~= 2 then
  return mp.CLEAN
end
local l_0_1 = mp.readu_u32(headerpage, 9)
if l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2 = mp.readu_u32(headerpage, 13)
if l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_3 = l_0_1 + l_0_2 + 17
if l_0_3 >= mp.HEADERPAGE_SZ then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, l_0_3) ~= 19280 then
  return mp.CLEAN
end
mp.readprotection(false)
mp.vfo_add_buffer(mp.readfile(l_0_3 - 1, l_0_0 - l_0_3 + 1), "[ChromeCrxPackage]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
