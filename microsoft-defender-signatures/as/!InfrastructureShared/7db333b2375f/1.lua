-- Threat: !InfrastructureShared
-- Name: 7db333b2375f
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_1 = l_0_0:match("(%w+%.exe)$")
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%"))
if (l_0_0:find(l_0_2 .. "\\system32", 1, true) or l_0_0:find(l_0_2 .. "\\syswow64", 1, true)) and l_0_1 == "rundll32.exe" then
  if this_sigattrlog[4].matched then
    mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1), 3153487608)
  else
    mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1), 2865379549)
  end
  return mp.INFECTED
end
return mp.CLEAN
