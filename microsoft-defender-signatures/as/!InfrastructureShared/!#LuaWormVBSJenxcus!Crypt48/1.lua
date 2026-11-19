-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:VBS/Jenxcus!Crypt48
-- Type: 13
-- Includes: ConversionToBinary_fastDec2Bin

if not mp.get_mpattribute("SCPT:Worm:VBS/Jenxcus!Crypt48") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 200000 or 30000000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.match(l_0_1, "%w-%s-=%s-\"(%d%d%d?[^%d]+%d%d%d?[^%d]+%d%d%d?[^%d]+.-)\"%s-execute")
if l_0_2 == nil then
  return mp.CLEAN
end
mp.vfo_add_buffer(fastDec2Bin(l_0_2, "(%d+)[^%d]+"), "[Crypt48]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
