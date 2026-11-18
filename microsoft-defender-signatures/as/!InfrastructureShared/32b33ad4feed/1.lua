-- Threat: !InfrastructureShared
-- Name: 32b33ad4feed
-- Type: 21
-- Includes: BMLuaLib, AppomalyHelpers, LuaFuncHelper

local l_0_0 = add_parents_mp()
local l_0_1 = {}
l_0_1.parents_info_mp = l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_1.parent_OFN = this_sigattrlog[1].utf8p2
end
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.ImagePath then
    local l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_3.ImagePath)
    if contains(l_0_4, "onedrive") then
      bm.add_threat_file(l_0_4)
      break
    end
  end
end
bm.add_related_string("Additional_Info", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
return mp.INFECTED
