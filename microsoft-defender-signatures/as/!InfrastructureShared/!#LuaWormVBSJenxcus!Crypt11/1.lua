-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:VBS/Jenxcus!Crypt1.1
-- Type: 13
-- Includes: ConversionToBinary_fastDec2Bin

if not mp.get_mpattribute("TARG:Worm:VBS/Jenxcus!Crypt1") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 60000 or 500000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_1:match("'execute%(%p%(?(.-)%)?%)\r\n")
if l_0_2 == nil then
  return mp.CLEAN
end

local function l_0_3(l_1_0, l_1_1)
  return l_1_0 - l_1_1
end

local l_0_4 = l_0_2:gsub("(%d%d?%d?%d?)%-%s(%d%d?%d?%d?)[^%d]?%)?%s?%p?%s?%p?", l_0_3)
mp.vfo_add_buffer(fastDec2Bin(l_0_4, "(%d+)[^%d]?"), "[JenxcusCrypt1.1]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
