-- Threat: !InfrastructureShared
-- Name: 10ab33a4464f5
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if contains(l_0_1, "vmblastsg") then
    l_0_0 = l_0_1
  end
else
  return mp.CLEAN
end
if contains(l_0_0, "absg-worker.js") and contains(l_0_0, "req.connection.end") then
  return mp.INFECTED
end
return mp.CLEAN
