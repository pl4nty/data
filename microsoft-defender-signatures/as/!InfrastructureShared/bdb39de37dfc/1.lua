-- Threat: !InfrastructureShared
-- Name: bdb39de37dfc
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil or #l_0_0 <= 5 then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"(c:\\users\\[^\\\\]+[/\\\\]appdata[/\\\\]local[/\\\\]temp[/\\\\][^/\\\\\"]+%.js)\"")
if l_0_1 == nil or #l_0_1 <= 10 then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_1) then
  mp.ReportLowfi(l_0_1, 2929466810)
  return mp.INFECTED
else
  bm.trigger_sig("NodeJsLoadedInTempFolderB", l_0_1)
end
return mp.CLEAN
