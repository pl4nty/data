-- Threat: !InfrastructureShared
-- Name: !#LUA:JenxcusHexToString
-- Type: 13
-- Includes: ConversionToBinary_fastHex2Bin

local l_0_0
if mp.get_mpattribute("TARG:VBS/JenxcusHexToString") then
  l_0_0 = 1
elseif mp.get_mpattribute("TARG:VBS/JenxcusHexToString2") then
  l_0_0 = 2
elseif mp.get_mpattribute("SCPT:VBS/JenxcusHexToString") then
  l_0_0 = 3
else
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = tostring(l_0_2)
local l_0_4, l_0_5, l_0_6
if l_0_0 == 1 then
  _, l_0_4, l_0_5 = string.find(l_0_3, "= ?\"(.-)\"")
elseif l_0_0 == 2 then
  _, l_0_4, l_0_5, l_0_6 = string.find(l_0_3, "= ?\"(.-)\".-\"\".-\"\".-\"(.-)\"")
elseif l_0_0 == 3 then
  _, l_0_4, l_0_5, l_0_6 = string.find(l_0_3, "= ?\"((.)[0-9A-Za-z][0-9A-Za-z]?.[0-9A-Za-z][0-9A-Za-z]?.[0-9A-Za-z][0-9A-Za-z]?.+)\"")
else
  return mp.CLEAN
end
if #l_0_5 < 5000 then
  l_0_4 = 1
  while 5000 > string.len(l_0_5) do
    _, l_0_4, l_0_5 = string.find(l_0_3, "\"(.-)\"", l_0_4 + 2)
    if l_0_5 == nil then
      break
    end
  end
end
if #l_0_5 < 5000 then
  return mp.CLEAN
end
local l_0_7, l_0_8
if l_0_0 == 1 then
  l_0_7, l_0_8 = fastHex2Bin(l_0_5, "(..)")
else
  l_0_5, _ = l_0_5:gsub(l_0_6 .. "(.)" .. l_0_6, l_0_6 .. "0%1" .. l_0_6)
  l_0_5, _ = l_0_5:gsub(l_0_6 .. "(.)" .. l_0_6, l_0_6 .. "0%1" .. l_0_6)
  l_0_7, l_0_8 = fastHex2Bin(l_0_5, l_0_6 .. "(..)")
end
mp.vfo_add_buffer(l_0_7:sub(1, l_0_8), "[JenxcusHexToStr]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
