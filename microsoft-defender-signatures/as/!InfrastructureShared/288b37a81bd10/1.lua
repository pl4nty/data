-- Threat: !InfrastructureShared
-- Name: 288b37a81bd10
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[5].matched then
  if this_sigattrlog[5].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= "" then
    l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
  end
elseif this_sigattrlog[6].matched then
  if this_sigattrlog[6].utf8p2 ~= nil and this_sigattrlog[6].utf8p2 ~= "" then
    l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
  end
elseif this_sigattrlog[7].matched then
  if this_sigattrlog[7].utf8p2 ~= nil and this_sigattrlog[7].utf8p2 ~= "" then
    l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
  end
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil and this_sigattrlog[8].utf8p2 ~= "" then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p2)
end
if l_0_0 ~= nil and l_0_0 ~= "" and SuspMacPathsToMonitor(l_0_0, false) then
  return mp.INFECTED
end
return mp.CLEAN
