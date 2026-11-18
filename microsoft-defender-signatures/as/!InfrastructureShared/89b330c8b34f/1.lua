-- Threat: !InfrastructureShared
-- Name: 89b330c8b34f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_0 ~= nil and (string.find(l_0_0, "\\microsoft\\exchange server\\v[1-9][0-9]\\frontend\\") ~= nil or string.find(l_0_0, "\\frontend\\httpproxy\\owa\\", 1, true) ~= nil or string.find(l_0_0, "\\inetpub\\wwwroot\\", 1, true) ~= nil or string.find(l_0_0, "\\microsoft\\exchange server\\v[1-9][0-9]\\clientaccess\\") ~= nil) and IsExchangeServer() then
  local l_0_1 = string.match(l_0_0, "(.*\\)[^\\]+$")
  if l_0_1 then
    bm.trigger_sig("TriggerShellPath", l_0_1)
  end
  mp.ReportLowfi(l_0_0, 1067831818)
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
