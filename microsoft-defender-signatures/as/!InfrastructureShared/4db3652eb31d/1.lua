-- Threat: !InfrastructureShared
-- Name: 4db3652eb31d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = extractDllForRegproc(l_0_0)
  if l_0_1 and mp.IsKnownFriendlyFile(l_0_1, true, false) == false then
    bm.add_threat_file(l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN
