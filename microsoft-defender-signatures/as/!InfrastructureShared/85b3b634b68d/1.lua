-- Threat: !InfrastructureShared
-- Name: 85b3b634b68d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3.image_path ~= nil and string.find(string.lower(l_0_3.image_path), "\\rundll32.exe", 1, true) then
    local l_0_4 = mp.bitand(l_0_3.reason_ex, bm.RELATIONSHIP_INJECTION)
    if l_0_4 == bm.RELATIONSHIP_INJECTION then
      TrackPidAndTechniqueBM(l_0_3.ppid, "T1055.002", "processinjection_target")
    end
  end
end
return mp.INFECTED
