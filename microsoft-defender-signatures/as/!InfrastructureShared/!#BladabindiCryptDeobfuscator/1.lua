-- Threat: !InfrastructureShared
-- Name: !#BladabindiCryptDeobfuscator
-- Type: 13
-- MpAttributes: SCPT:BladaCryptObf

local l_0_0 = mp.getfilesize()
if l_0_0 > mp.HEADERPAGE_SZ then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
local l_0_2, l_0_3, l_0_4, l_0_5, l_0_6 = string.find(l_0_1, "\"(.-)\".-\"(.-)\".-%-.-%-%s-0-([1-9]%d-)%)")
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_7, l_0_8 = string.gsub(l_0_5, "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])", "%%%1")
local l_0_9 = string.format

local function l_0_10(l_1_0)
  return l_0_9("%c", tonumber(l_1_0, 10) - l_0_6)
end

local l_0_11, l_0_12 = string.gsub(l_0_4, "(%d-)" .. l_0_7, l_0_10, 6144)
mp.vfo_add_buffer(l_0_11:sub(1, l_0_12), "[DeBLAD]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
mp.set_mpattribute("//LOWFI:LUA:Bladabindi")
return mp.CLEAN
