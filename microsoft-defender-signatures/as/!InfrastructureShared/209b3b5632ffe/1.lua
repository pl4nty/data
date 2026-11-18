-- Threat: !InfrastructureShared
-- Name: 209b3b5632ffe
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[9].utf8p1))
end
local l_0_1, l_0_2 = pcall(mp.ContextualExpandEnvironmentVariables, l_0_0)
if l_0_1 then
  l_0_0 = l_0_2
end
l_0_0 = string.lower(l_0_0)
local l_0_3 = l_0_0:match("([^\\]+)$")
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
  "dbghelp.dll",
  "winhttp.dll",
  "dbgcore.dll",
  "winmm.dll",
  "wtsapi32.dll",
  "wkscli.DLL",
  "srvcli.dll",
  "oleacc.dll",
  "rasdlg.dll",
  "mf.dll",
  "credui.dll"
}
if not contains(l_0_3, l_0_4) then
  return mp.CLEAN
end
if not mp.IsKnownFriendlyFile(l_0_0, true, false) then
  if sysio.IsFileExists(l_0_0) then
    local l_0_5 = sysio.GetFileSize(l_0_0)
    if l_0_5 < 20000000 then
      bm.add_related_file(l_0_0)
    end
  end
  bm.add_related_string("DLLSearchHijacking", tostring(l_0_0), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
