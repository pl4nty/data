-- Threat: !InfrastructureShared
-- Name: 1fbb3a3f297bb
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p2
else
  return mp.CLEAN
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if contains(l_0_1, "{0}") then
    l_0_0 = l_0_1
  end
end
local l_0_2 = {
  "[CloudMan]",
  "/oauth2/v2.0/token"
}
if contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
l_0_0 = string.gsub(l_0_0, "%'%'%+%'%'", "")
local l_0_3 = "(?:\\{\\d+\\}(?:\\w+)?(?:\\{\\d+\\})?){3,10}.{1,10}-f"
local l_0_4 = false
l_0_4, _ = MpCommon.StringRegExpSearch(l_0_3, l_0_0)
if l_0_4 == true then
  bm.add_related_string("PShellEnc_cmdline", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
