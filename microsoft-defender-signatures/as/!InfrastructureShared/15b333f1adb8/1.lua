-- Threat: !InfrastructureShared
-- Name: 15b333f1adb8
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = false
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 ~= nil and l_0_1.ppid ~= nil then
  local l_0_2, l_0_3 = bm.get_process_relationships()
  if l_0_3 ~= nil then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      if l_0_5.image_path ~= nil and l_0_5.ppid ~= nil then
        TrackPidAndTechniqueBM(l_0_5.ppid, "T1548.002", "uac_bypass_trg")
        l_0_0 = true
      end
    end
  end
end
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
