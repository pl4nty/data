-- Threat: !InfrastructureShared
-- Name: 3a7b37fb9719a
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[19].matched and this_sigattrlog[19].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[19].utf8p2
elseif this_sigattrlog[20].matched and this_sigattrlog[20].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[20].utf8p2
elseif this_sigattrlog[21].matched and this_sigattrlog[21].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[21].utf8p2
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
if l_0_4 ~= nil then
  for l_0_6, l_0_7 in ipairs(l_0_4) do
    if l_0_7.image_path and string.find(string.lower(l_0_7.image_path), "\\bun.exe", -8, true) then
      return mp.CLEAN
    end
  end
end
for l_0_8, l_0_9 in ipairs(l_0_5) do
  if l_0_9.image_path and string.find(string.lower(l_0_9.image_path), "\\bun.exe", -8, true) then
    TrackPidAndTechniqueBM(l_0_9.ppid, "T1195.001", "SuspBunProcess", 1800)
  end
end
local l_0_10, l_0_11 = pcall(reportBmInfo)
if not l_0_10 and l_0_11 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_11), bm.RelatedStringBMReport)
end
return mp.INFECTED
