-- Threat: !InfrastructureShared
-- Name: 4bb39de320f9
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = bm_AddRelatedFileFromCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3 ~= nil and l_0_3 ~= "" and (StringEndsWith(l_0_3, ".js") or StringEndsWith(l_0_3, ".vbs")) then
    l_0_3 = l_0_3:lower()
    if sysio.IsFileExists(l_0_3) and IsKeyInRollingQueue("CC_filelist", l_0_3, true) then
      local l_0_4 = {}
      if GetTrackingDataForFile(l_0_3, l_0_4) and l_0_4 ~= nil then
        l_0_4 = safeJsonSerialize(l_0_4)
        bm.add_related_string("CC_filelist", l_0_4, bm.RelatedStringBMReport)
      end
    end
  end
end
return mp.INFECTED
