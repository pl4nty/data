-- Threat: !InfrastructureShared
-- Name: 152b3f7634328
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
end
if contains(l_0_0, {"rundll32", "regsvr32"}) then
  l_0_0 = l_0_0:lower()
elseif contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if contains(l_0_1, {"rundll32", "regsvr32"}) then
    l_0_0 = l_0_1:lower()
  end
else
  return mp.CLEAN
end
if contains(l_0_0, "http") and contains(l_0_0, "invoke-webRequest") and (contains(l_0_0, "start-process") or contains(l_0_0, "get%-item.*%).length%s+%-ge%s+", false)) then
  return mp.INFECTED
end
return mp.CLEAN
