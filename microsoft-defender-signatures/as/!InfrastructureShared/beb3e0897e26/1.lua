-- Threat: !InfrastructureShared
-- Name: beb3e0897e26
-- Type: 21

local l_0_0 = ""
local l_0_1 = ""
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[3].utf8p1)
end
if l_0_1 then
  if string.match(l_0_1, ".inf$") then
    bm.add_related_string("SuspClfsAccess_WF", tostring(l_0_1), bm.RelatedStringBMReport)
  else
    return mp.CLEAN
  end
end
if l_0_0 then
  if string.find(l_0_0, "\\windows\\system32\\", 1, true) or string.find(l_0_0, "ntuser.dat", 1, true) or string.find(l_0_0, "}.tm.blf", 1, true) then
    return mp.CLEAN
  else
    bm.add_related_string("SuspClfsAccess_CLFS", tostring(l_0_0), bm.RelatedStringBMReport)
  end
end
return mp.INFECTED
