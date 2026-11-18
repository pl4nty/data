-- Threat: !InfrastructureShared
-- Name: !#SimpleAsciiObfuscator
-- Type: 13
-- MpAttributes: SCPT:SimpleAsciiObfuscator

local l_0_0 = mp.getfilesize()
if l_0_0 < 250 then
  return mp.CLEAN
end
if 1048576 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.find(tostring(headerpage), "[eE][xX][eE][cC][uU][tT][eE]%s-%(+%s-[cC][hH][rR]%(+")
if l_0_2 == nil then
  l_0_1, l_0_2 = string.find(tostring(headerpage), "[eE][xX][eE][cC][uU][tT][eE][gG][lL][oO][bB][aA][lL]%([cC][hH][rR]%(")
end
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3, l_0_4
local l_0_5 = "%)+ -& -_?%s-vbcrlf -%)+"
if l_0_0 > mp.HEADERPAGE_SZ then
  l_0_3, l_0_1 = string.find(tostring(footerpage), l_0_5)
  mp.readprotection(false)
  l_0_4 = mp.readfile(l_0_2 - 1, l_0_0 - mp.FOOTERPAGE_SZ + l_0_3 - l_0_2 + 1)
else
  l_0_3, l_0_1 = string.find(tostring(headerpage), l_0_5)
  l_0_4 = tostring(headerpage):sub(l_0_2, l_0_3)
end
l_0_4 = l_0_4:gsub("%)+ ?& ?_?%s-[cC][hH][rR]%(+", ",")
local l_0_6 = "(%d+)^%(-(%d+%/%d+)"
local l_0_7 = string.find(l_0_4, l_0_6)
if l_0_7 ~= nil then
  l_0_4 = string.gsub(l_0_4, l_0_6, "Math.pow%(%1,%(%2%)%)%+0.5", 3000)
  l_0_4 = l_0_4:sub(1, l_0_4:find("%^%(") - 1) .. "%1)"
end
mp.vfo_add_buffer("eval(String.fromCharCode" .. l_0_4 .. ")", "[toJS]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
