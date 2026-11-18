-- Threat: !InfrastructureShared
-- Name: !#Lua:TrojanDropper:VBS/Micwix!Crypt1
-- Type: 13
-- Includes: ConversionToBinary_fastDec2Bin
-- MpAttributes: SCPT:VBS/Micwix.Config

local l_0_0 = mp.getfilesize()
if l_0_0 <= 500000 or 4000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = tostring(headerpage):sub(0, 512):find("= \".-39")
local l_0_3, l_0_4 = tostring(footerpage):find("%d[%D]-\"%s")
mp.readprotection(false)
local l_0_5 = mp.readfile(l_0_2 - 2, l_0_0 - 4098 + l_0_4)
if l_0_5 ~= nil then
  mp.vfo_add_buffer(fastDec2Bin(l_0_5, "(%d+)[%D]+"), "[Micwix]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  return mp.INFECTED
end
return mp.CLEAN
