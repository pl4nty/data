-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:VBS/Jenxcus!CrypterRevB64
-- Type: 13
-- MpAttributes: Lua:VBS/CrypterRevB64 | SCPT:VBS/CrypterRevB64 | AGG:VBS/CrypterRevB64

local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 then
  return mp.CLEAN
end
if 500000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2, l_0_3, l_0_4 = l_0_1:find("'(.-)%s")
if l_0_4 == nil then
  return mp.CLEAN
end
l_0_4 = l_0_4:reverse()
mp.set_mpattribute("//MpBase64DecodeLongLines")
mp.vfo_add_buffer(l_0_4, "[RevB64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
