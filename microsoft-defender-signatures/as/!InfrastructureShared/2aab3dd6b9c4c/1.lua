-- Threat: !InfrastructureShared
-- Name: 2aab3dd6b9c4c
-- Type: 21

if not this_sigattrlog[10].ppid then
  return mp.CLEAN
end
local l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[10].ppid)
if l_0_0.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  local l_0_1, l_0_2 = bm.get_process_relationships()
  if l_0_1 ~= nil then
    for l_0_3, l_0_4 in ipairs(l_0_1) do
      if l_0_4.image_path ~= nil then
        local l_0_5 = string.lower(l_0_4.image_path)
        if string.find(l_0_5, "\\chrome.exe", -11, true) then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
