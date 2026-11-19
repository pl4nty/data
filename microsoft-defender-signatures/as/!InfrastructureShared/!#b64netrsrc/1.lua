-- Threat: !InfrastructureShared
-- Name: !#b64netrsrc
-- Type: 13

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 16777216 < l_0_0 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 3203386062 or mp.readu_u32(headerpage, 5) ~= 1 then
  return mp.CLEAN
end
if mp.crc32(-1, headerpage, 13, 145) ~= 1098233996 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2 = 1
for l_0_3 in string.gmatch(l_0_1, "TV[%w+/]+=?=?") do
  if 5 < l_0_2 then
    break
  end
  if 4096 < #l_0_3 and #l_0_3 < 16777216 then
    mp.set_mpattribute("//MpBase64DecodeLongLines")
    mp.vfo_add_buffer(l_0_3, string.format("[b64netrsrc-%x]", l_0_2), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    l_0_2 = l_0_2 + 1
  end
end
return mp.CLEAN
