-- Threat: !InfrastructureShared
-- Name: 292b3b143b002
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[13].matched and this_sigattrlog[13].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p2
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[14].utf8p2
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[15].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
      if StringEndsWith(l_0_3, ".js") or StringEndsWith(l_0_3, ".mjs") or StringEndsWith(l_0_3, ".cjs") then
        bm.add_threat_file(l_0_3)
      end
    end
  end
end
local l_0_4, l_0_5 = bm.get_process_relationships()
for l_0_6, l_0_7 in ipairs(l_0_5) do
  if l_0_7.image_path and string.find(string.lower(l_0_7.image_path), "/bun", -4, true) then
    TrackPidAndTechniqueBM(l_0_7.ppid, "T1195.001", "SuspBunProcess", 1800)
  end
end
local l_0_8, l_0_9 = pcall(reportBmInfo)
if not l_0_8 and l_0_9 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_9), bm.RelatedStringBMReport)
end
return mp.INFECTED
