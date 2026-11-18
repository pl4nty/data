-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:JS/Bondat!Crypt3
-- Type: 13
-- Includes: ConversionToBinary_fastBase2Dec

if not mp.get_mpattribute("SCRIPT:Worm:JS/Bondat!Crypt3") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 85000 or 95000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
local l_0_2 = string.match(l_0_1, ".slice%(%w+, %w+ %+= (%d+)%)")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_1, "return parseInt%(%w+, (%d+)%)")
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = tonumber(l_0_3)
local l_0_5 = 255
local l_0_6 = 0
local l_0_7
repeat
  l_0_7 = l_0_5 % l_0_4
  l_0_5 = l_0_5 / l_0_4
  l_0_6 = l_0_6 + 1
until l_0_7 == l_0_5 and l_0_7 == 0
local l_0_8 = tonumber(l_0_2)
if l_0_8 < l_0_6 - 1 then
  return mp.CLEAN
end
local l_0_9, l_0_10, l_0_11 = string.find(tostring(headerpage), "(fromCharCode.-\")%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w")
if l_0_9 == nil then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_12 = 4500
local l_0_13 = mp.readfile(l_0_9 + #l_0_11 - 1, l_0_12 * l_0_8 * 2)
if l_0_13 == nil then
  return mp.CLEAN
end
local l_0_14 = "."
local l_0_15 = fastBase2Dec(l_0_13, l_0_14:rep(l_0_8), l_0_4)
if l_0_15 == nil then
  return mp.CLEAN
end
local l_0_16 = string.char
local l_0_17 = string.byte

local function l_0_18(l_1_0, l_1_1)
  return l_0_16(mp.bitxor(l_0_17(l_1_0), l_0_17(l_1_1)))
end

mp.vfo_add_buffer(l_0_15:gsub("(.)(.)", l_0_18, l_0_12), "[BondatCrypt3]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
