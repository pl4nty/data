-- Threat: !InfrastructureShared
-- Name: !#LUA:JenxcusDeCYBER
-- Type: 13
-- Includes: ConversionToBinary_fastHex2Bin
-- MpAttributes: SCPT:JenxcusDeCYBER

local l_0_0 = mp.getfilesize()
if 2097152 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if nil == string.match(l_0_1, "^%%[0-9A-Za-z][0-9A-Za-z]%%[0-9A-Za-z][0-9A-Za-z]%%[0-9A-Za-z][0-9A-Za-z]") then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_0)
if l_0_2 == nil then
  return mp.CLEAN
end
mp.vfo_add_buffer(fastHex2Bin(l_0_2, "%%([0-9A-Za-z][0-9A-Za-z])"), "[JenxcusDeHex]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
