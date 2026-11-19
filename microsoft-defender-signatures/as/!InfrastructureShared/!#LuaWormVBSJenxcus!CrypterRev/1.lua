-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:VBS/Jenxcus!CrypterRev
-- Type: 13
-- Includes: ConversionToBinary_fastHex2Bin
-- MpAttributes: Lua:VBS/CrypterRev | SCPT:VBS/CrypterRev | Lua:VBS/CrypterRev.1

local l_0_0 = mp.getfilesize()
if l_0_0 < 9000 then
  return mp.CLEAN
end
if 300000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2, l_0_3, l_0_4 = l_0_1:find("'(%x-)%s")
l_0_4 = l_0_4:reverse()
mp.vfo_add_buffer(fastHex2Bin(l_0_4, "(..)"), "[JenxcusRev]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
