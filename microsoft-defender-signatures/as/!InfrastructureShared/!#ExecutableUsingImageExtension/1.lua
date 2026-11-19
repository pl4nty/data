-- Threat: !InfrastructureShared
-- Name: !#ExecutableUsingImageExtension
-- Type: 10

local l_0_0 = string.lower(mp.getfilename())
local l_0_1, l_0_2 = l_0_0:find("%.%w+$")
if nil == l_0_1 then
  return mp.CLEAN
end
local l_0_3 = l_0_0:sub(l_0_1 + 1, l_0_2)
local l_0_4 = false
if "jpg" == l_0_3 or "jpeg" == l_0_3 or "gif" == l_0_3 or "png" == l_0_3 or "bmp" == l_0_3 or "tiff" == l_0_3 or "tif" == l_0_3 or "pnm" == l_0_3 or "ppm" == l_0_3 or "pgm" == l_0_3 or "pbm" == l_0_3 then
  l_0_4 = true
end
if l_0_4 == false then
  return mp.CLEAN
end
local l_0_5 = l_0_0:sub(1, l_0_1 - 1)
local l_0_6 = false
if "run32" == l_0_5 or "run64" == l_0_5 or "x32" == l_0_5 or "x64" == l_0_5 or "ms32" == l_0_5 or "ms64" == l_0_5 then
  l_0_6 = true
end
if l_0_6 then
  mp.set_mpattribute("Lua:ExecutableUsingImageExtension!dha")
else
  mp.set_mpattribute("Lua:ExecutableUsingImageExtension")
end
return mp.CLEAN
