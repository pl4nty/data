-- Threat: !InfrastructureShared
-- Name: a1b31941a0b7
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
end
if l_0_0 ~= nil and (string.find(l_0_0, "\\microsoft\\exchange server\\v%d%d\\frontend\\") ~= nil or string.find(l_0_0, "\\frontend\\httpproxy\\owa\\", 1, true) ~= nil or string.find(l_0_0, "\\inetpub\\wwwroot\\", 1, true) ~= nil or string.find(l_0_0, "\\microsoft\\exchange server\\v%d%d\\clientaccess\\") ~= nil) then
  if sysio.IsFileExists(l_0_0) then
    local l_0_1 = string.match(l_0_0, "(.*\\)[^\\]+$")
    if l_0_1 then
      bm.trigger_sig("TriggerShellPath", l_0_1)
    end
    bm.add_related_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
