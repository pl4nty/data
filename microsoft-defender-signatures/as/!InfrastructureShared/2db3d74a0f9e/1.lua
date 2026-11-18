-- Threat: !InfrastructureShared
-- Name: 2db3d74a0f9e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[2].image_path
local l_0_3 = bm_AddRelatedFileFromCommandLine(l_0_0)
if l_0_3 == nil then
  return mp.CLEAN
end
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if l_0_5 ~= nil and l_0_5 ~= "" and (StringEndsWith(l_0_5, ".cmd") or StringEndsWith(l_0_5, ".bat")) then
    l_0_5 = l_0_5:lower()
    if sysio.IsFileExists(l_0_5) and IsKeyInRollingQueue("CC_filelist", l_0_5, true) then
      local l_0_6 = 31536000
      local l_0_7 = {
        type = "PLCMD",
        ProcessImagePath = l_0_2,
        ProcessPID = this_sigattrlog[2].ppid,
        ProcessCmd = l_0_1,
        parent = this_sigattrlog[1].ppid,
        score = 4
      }
      AppendToRollingQueue("CC_filelist", l_0_2, safeJsonSerialize(l_0_7), l_0_6, 32)
      local l_0_8 = {}
      if GetTrackingDataForFile(l_0_5, l_0_8) and l_0_8 ~= nil then
        l_0_8 = safeJsonSerialize(l_0_8)
        bm.add_related_string("CC_filelist", l_0_8, bm.RelatedStringBMReport)
      end
    end
  end
end
return mp.INFECTED
