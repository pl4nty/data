-- Threat: !InfrastructureShared
-- Name: 38b3c78eea93
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
else
  return mp.CLEAN
end
if not contains(l_0_0, "%%.*:~.*%%", false) then
  return mp.CLEAN
end
if contains(l_0_0, "echo %%%w+:~0,2%%", false) then
  return mp.CLEAN
end
local l_0_1 = {
  "%%allusersprofile:~",
  "%%appdata:~",
  "%%commonprogramfiles%(x86%):~",
  "%%commonprogramfiles:~",
  "%%commonprogramw6432:~",
  "%%comspec:~",
  "%%localappdata:~",
  "%%programdata:~",
  "%%programfiles%(x86%):~",
  "%%programfiles:~",
  "%%programw6432:~",
  "%%psmodulepath:~",
  "%%public:~",
  "%%systemdrive:~",
  "%%systemroot:~",
  "%%temp:~",
  "%%tmp:~",
  "%%userprofile:~",
  "%%windir:~"
}
local l_0_2 = "%s*[%-%+]?%d+%s*,%s*[%-%+]?%d+%s*%%"
for l_0_3, l_0_4 in pairs(l_0_1) do
  if contains(l_0_0, l_0_4 .. l_0_2, false) then
    bm.add_related_string("ShellEncode_cmdline", l_0_0, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
