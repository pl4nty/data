-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:VBS/Jenxcus!CrypterRepRev
-- Type: 13
-- Includes: ConversionToBinary_fastHex2Bin

if not mp.get_mpattribute("SCPT:Worm:VBS/Jenxcus!CryptRepRev") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 9000 or 300000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
local l_0_2 = l_0_1:match("=%s-replace%s-%(%a-%s-,%s-\"..?.?.?.?.?\"%s-,%s-\"(%d-)\"%)%s")
if l_0_2 == nil then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = mp.readfile(0, l_0_0)
local l_0_4 = l_0_3:match("'(.-)%s")
if l_0_4 == nil then
  return mp.CLEAN
end
l_0_4 = l_0_4:gsub("[^0-9A-F][^0-9A-F]?[^0-9A-F]?[^0-9A-F]?[^0-9A-F]?[^0-9A-F]?", l_0_2)
l_0_4 = l_0_4:reverse()
mp.vfo_add_buffer(fastHex2Bin(l_0_4, "(..)"), "[CrypterRepRev]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
