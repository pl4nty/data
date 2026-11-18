-- Threat: !InfrastructureShared
-- Name: cab3ec9ba23d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  if l_0_0 ~= nil and string.len(l_0_0) > 3 and contains(l_0_0, " copy ") and contains(l_0_0, "\\windows\\temp\\") and (contains(l_0_0, "\\share$\\") or contains(l_0_0, "\\admin$\\") or contains(l_0_0, " \\\\") or contains(l_0_0, " \"\"\\\\")) then
    bm_AddRelatedFileFromCommandLine(l_0_0)
    local l_0_1, l_0_2 = pcall(reportBmInfo)
    if not l_0_1 and l_0_2 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
