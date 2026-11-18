-- Threat: !InfrastructureShared
-- Name: !#LUA:JenxcusCyberCrypt
-- Type: 13
-- Includes: ConversionToBinary_fastHex2Bin
-- MpAttributes: SCPT:JenxcusCyberCrypt & !TOLUA:ScriptNullHeader

local l_0_0 = mp.getfilesize()
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "\"(.-)\"")
while string.len(l_0_4) < 5000 do
  l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "\"(.-)\"", l_0_3 + 2)
end
if string.match(l_0_4, "^%%[0-9A-Za-z][0-9A-Za-z]%%[0-9A-Za-z][0-9A-Za-z]%%[0-9A-Za-z][0-9A-Za-z]") then
  local l_0_5, l_0_6 = fastHex2Bin(l_0_4, "%%" .. "(..)")
  l_0_4 = l_0_5:sub(1, l_0_6)
end
if string.len(l_0_4) < 5000 then
  return mp.CLEAN
end
if string.len(l_0_4) > 2097152 then
  return mp.CLEAN
end
if mp.get_mpattribute("SCPT:ReverseBase64") then
  l_0_4 = l_0_4:reverse()
end
if l_0_4:match("^==") then
  l_0_4 = l_0_4:reverse()
end
mp.set_mpattribute("//MpBase64DecodeLongLines")
mp.vfo_add_buffer(l_0_4, "[Jenxcus]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
