-- Threat: !InfrastructureShared
-- Name: 15fb3f6ab43c4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 == nil or #l_0_0 <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, " start ", 1, true) == nil or string.find(l_0_0, " /min ", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"([^\"]+)\"")
if l_0_1 == nil or #l_0_1 <= 10 then
  return mp.CLEAN
end
if string.find(l_0_1, "\\appdata\\local\\", 1, true) == nil then
  return mp.CLEAN
end
if not StringEndsWith(l_0_1, ".js") then
  if StringEndsWith(l_0_1, "\\") then
    l_0_1 = l_0_1 .. "index.js"
  else
    l_0_1 = l_0_1 .. "\\index.js"
  end
end
if sysio.IsFileExists(l_0_1) then
  mp.ReportLowfi(l_0_1, 851748235)
  return mp.INFECTED
else
  bm.trigger_sig("SuspNodeJsInAppDataB", l_0_1)
end
return mp.CLEAN
