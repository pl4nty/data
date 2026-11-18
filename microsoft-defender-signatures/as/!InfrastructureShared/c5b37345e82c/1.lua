-- Threat: !InfrastructureShared
-- Name: c5b37345e82c
-- Type: 21

local l_0_0 = this_sigattrlog[2].utf8p1
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if not l_0_0 or string.len(l_0_0) < 5 then
  return mp.CLEAN
end
local l_0_1 = {
  [".jpg"] = true,
  jpeg = true,
  [".png"] = true,
  [".gif"] = true,
  [".bmp"] = true,
  tiff = true,
  [".tif"] = true,
  [".ppm"] = true,
  [".pnm"] = true,
  [".pgm"] = true,
  [".pbm"] = true
}
local l_0_2 = l_0_0:sub(-4)
if l_0_1[l_0_2] and (string.find(l_0_0, "%appdata%\\", 1, true) or string.find(l_0_0, "appdata\\roaming\\", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
