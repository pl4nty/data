-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:VBS/Jenxcus!CrypterRep
-- Type: 13
-- Includes: ConversionToBinary_fastDec2Bin
-- MpAttributes: SCPT:VBS/CrypterRep

local l_0_0 = mp.getfilesize()
if l_0_0 < 15000 then
  return mp.CLEAN
end
if 500000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
local l_0_2, l_0_3
local l_0_4 = {}
local l_0_5 = {}
for l_0_6 = 0, 9 do
  l_0_3 = string.format("[Rr][Ee][Pp][Ll][Aa][Cc][Ee]%%s-%%(%%a-,\"(.)\",\"[%d]\"", l_0_6)
  l_0_2 = string.match(l_0_1, l_0_3)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  table.insert(l_0_4, l_0_2)
  l_0_5[l_0_2] = l_0_6
end
local l_0_7 = string.format("[%s]", table.concat(l_0_4, ""))
mp.readprotection(false)
local l_0_8 = mp.readfile(0, l_0_0)
local l_0_9 = string.match(l_0_8, "=%s-\"(%c-)\"")
if l_0_9 == nil then
  return mp.CLEAN
end
l_0_9 = l_0_9:gsub(l_0_7, l_0_5)
mp.vfo_add_buffer(fastDec2Bin(l_0_9, "(%d+)[^%d]?"), "[Jenxcus]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
