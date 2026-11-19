-- Threat: \xa5!Jenxcus
-- Type: 13

if not mp.get_mpattribute("TARG:Worm:VBS/Jenxcus!Crypt1") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 110000 or 500000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
l_0_1 = string.lower(l_0_1)
local l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7 = l_0_1:match("'execute%(%p%((%d%d%d?%d?)%-%s(%d%d%d?%d?)%)%s&%s%p%((%d%d%d?%d?)%-%s(%d%d%d?%d?)%)%s&%s%p%((%d%d%d?%d?)%-%s(%d%d%d?%d?)%)")
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_4 == nil then
  return mp.CLEAN
end
if l_0_5 == nil then
  return mp.CLEAN
end
if l_0_6 == nil then
  return mp.CLEAN
end
if l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8 = l_0_2 - l_0_3
if string.char(l_0_8) ~= "'" and string.char(l_0_8) ~= "\r" then
  return mp.CLEAN
end
l_0_8 = l_0_4 - l_0_5
if string.char(l_0_8) ~= "=" and string.char(l_0_8) ~= "<" and string.char(l_0_8) ~= "\n" then
  return mp.CLEAN
end
l_0_8 = l_0_6 - l_0_7
if string.char(l_0_8) ~= "-" and string.char(l_0_8) ~= "[" and string.char(l_0_8) ~= "h" then
  return mp.CLEAN
end
return mp.INFECTED
