-- Threat: !InfrastructureShared
-- Name: f1b393836f2b
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
  if contains(l_0_1, "invoke-webrequest") then
    l_0_0 = l_0_1
  end
else
  return mp.CLEAN
end
if contains(l_0_0, "[System.Convert]::ToBase64String") and contains(l_0_0, "ASCII.GetBytes") then
  return mp.INFECTED
end
return mp.CLEAN
