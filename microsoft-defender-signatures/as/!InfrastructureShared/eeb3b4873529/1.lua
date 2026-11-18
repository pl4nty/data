-- Threat: !InfrastructureShared
-- Name: eeb3b4873529
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if not l_0_0 then
  return mp.CLEAN
end
if contains(l_0_0, "download") or contains(l_0_0, "frombase64string") then
  return mp.INFECTED
elseif contains(l_0_0, "%-[eE][ncodNCOD]*%s+", false) then
  local l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if contains(l_0_1, "download") or contains(l_0_1, "frombase64string") then
    bm_AddRelatedFileFromCommandLine(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
