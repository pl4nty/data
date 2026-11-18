-- Threat: !InfrastructureShared
-- Name: 409b395b1102f
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil then
  l_0_1 = string.match(l_0_0, "wscript.*%s+%\"?%'?(%w:\\.*%.js)")
  if l_0_1 ~= nil then
    local l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_1)
    if sysio.IsFileExists(l_0_2) then
      bm.add_threat_file(l_0_2)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
