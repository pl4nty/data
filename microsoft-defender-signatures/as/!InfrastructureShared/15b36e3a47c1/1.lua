-- Threat: !InfrastructureShared
-- Name: 15b36e3a47c1
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level < MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_1 then
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if l_0_4.image_path and mp.bitand(l_0_4.reason_ex, 1) == 1 and string.find(l_0_4.image_path, "\\consent.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
