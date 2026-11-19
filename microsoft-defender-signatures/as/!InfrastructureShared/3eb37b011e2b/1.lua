-- Threat: !InfrastructureShared
-- Name: 3eb37b011e2b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if string.find(l_0_1, "\\program files", 1, true) ~= nil or string.find(l_0_1, "\\mpsigstub.exe", 1, true) ~= nil or string.find(l_0_1, "\\mpcmdrun.exe", 1, true) ~= nil then
  return mp.CLEAN
end
if string.sub(l_0_1, -16) == "\\threatsonar.exe" then
  local l_0_2 = mp.IsKnownFriendlyFile(l_0_1, true, false)
  if l_0_2 ~= nil and l_0_2 == true then
    return mp.CLEAN
  end
end
if string.find(l_0_0, "\\lsass.exe", 1, true) then
  local l_0_3, l_0_4 = bm.get_process_relationships()
  if l_0_3 then
    for l_0_5, l_0_6 in ipairs(l_0_3) do
      if l_0_6.image_path ~= nil and mp.bitand(l_0_6.reason_ex, 2) == 2 then
        local l_0_7 = string.lower(l_0_6.image_path)
        if string.find(l_0_7, "\\dell secureworks\\red cloak\\[^\\]+\\entwine.exe") or string.find(l_0_7, "\\program files\\morphisec\\bin\\protectorservice64.exe", 1, true) or string.find(l_0_7, "\\sentinelone\\sentinel agent[^\\]+\\sentinelagent.exe") then
          return mp.CLEAN
        end
      end
    end
  end
end
if TrackCustomPersistContextNameByPPID("query", "bm", "MimikatzTrigger") == true then
  return mp.INFECTED
end
return mp.CLEAN
