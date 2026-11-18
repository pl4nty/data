-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:VBS/Jenxcus!Crypt16
-- Type: 13
-- Includes: ConversionToBinary_fastDec2BinWithKey

if not mp.get_mpattribute("TARG:Worm:VBS/Jenxcus!Crypt16") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 50000 or 200000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_1:match("&%schr%(%a-%(%a-%)%-(%d-)%)")
if l_0_2 == nil then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = mp.readfile(0, l_0_0)
local l_0_4 = l_0_3:match("%a-%s=%s\"(%w-)\"\r\n")
if l_0_4 == nil then
  return mp.CLEAN
end
mp.vfo_add_buffer(fastDec2BinWithKey(l_0_4, "(%d+)[^%d]?", l_0_2, function(l_1_0, l_1_1)
  return l_1_1 + l_1_0
end), "[Crypt16]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
