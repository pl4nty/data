-- Threat: !InfrastructureShared
-- Name: 69b36051f3ea
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
  l_0_1 = this_sigattrlog[4].ppid
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if StringStartsWith(l_0_0, "%") then
  return mp.CLEAN
end
if l_0_0:find("microsoft\\onedrive\\", 1, true) or l_0_0:find("windows\\ccm", 1, true) then
  return mp.CLEAN
end
local l_0_2 = MpCommon.QueryPersistContext(l_0_0, "SuspPathsFromSchTask")
if l_0_2 then
  local l_0_3, l_0_4 = bm.get_process_relationships()
  if l_0_3 == nil then
    return mp.CLEAN
  end
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    if l_0_6.image_path ~= nil then
      local l_0_7 = "svchost.exe|taskeng.exe|taskhostw.exe"
      local l_0_8 = string.lower(string.match(l_0_6.image_path, "\\([^\\]+)$"))
      if l_0_8 ~= nil and string.find(l_0_7, l_0_8) then
        TrackPidAndTechniqueBM(l_0_1, "T1053.005", "schtask_target")
      end
    end
  end
end
return mp.CLEAN
