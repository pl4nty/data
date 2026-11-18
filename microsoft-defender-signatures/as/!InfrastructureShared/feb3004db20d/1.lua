-- Threat: !InfrastructureShared
-- Name: feb3004db20d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 ~= nil and 3 < string.len(l_0_0) and contains(l_0_0, {"transfer", "addfile"}) and (contains(l_0_0, "\\share$\\") or contains(l_0_0, "\\admin$\\") or contains(l_0_0, " \\\\") or contains(l_0_0, " \"\"\\\\")) then
  local l_0_1, l_0_2 = pcall(reportBmInfo)
  if not l_0_1 and l_0_2 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
return mp.CLEAN
