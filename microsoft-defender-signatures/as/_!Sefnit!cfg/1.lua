-- Threat: \xac!Sefnit!cfg
-- Type: 13

local l_0_0 = mp.getfilename()
if 35 > l_0_0:len() then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_1 < 177 or 2048 < l_0_1 then
  return mp.CLEAN
end
if ".ct" ~= string.sub(l_0_0, -3) then
  return mp.CLEAN
end
if nil ~= l_0_0:find("[\\]") then
  l_0_0 = l_0_0:match("([^\\]+)$")
end
if 35 ~= l_0_0:len() then
  return mp.CLEAN
end
if 3649324682 == mp.crc32(0, headerpage, 2, 16) then
  return mp.INFECTED
end
if 2453981930 == mp.crc32(0, headerpage, 2, 16) then
  return mp.INFECTED
end
local l_0_2 = mp.getfilename()
if nil ~= l_0_2:find("\\049e7fb749be2cdf169e28bb0a27254f\\7d0b14cec8baf661c8a240560c5b7c32.ct") then
  return mp.INFECTED
end
if nil ~= l_0_2:find("\\049e7fb749be2cdf169e28bb0a27254f\\74338f611481d85755401412c5513fb5.ct") then
  return mp.INFECTED
end
if nil ~= l_0_2:find("\\049e7fb749be2cdf169e28bb0a27254f\\181084e525a65ef540c63d60ce07f836.ct") then
  return mp.INFECTED
end
mp.set_mpattribute("Lua:Sefnit_Config_CT")
return mp.CLEAN
