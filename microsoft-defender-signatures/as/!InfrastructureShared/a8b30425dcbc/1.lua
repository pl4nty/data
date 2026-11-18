-- Threat: !InfrastructureShared
-- Name: a8b30425dcbc
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
end
if l_0_0 == nil or #l_0_0 <= 2 then
  return mp.CLEAN
end
local l_0_1 = l_0_0 .. "index.js"
if sysio.IsFileExists(l_0_1) then
  mp.ReportLowfi(l_0_1, 1741615482)
  return mp.INFECTED
else
  bm.trigger_sig("SuspNodeJSExecInCurrentFolderAB", l_0_1)
end
return mp.CLEAN
