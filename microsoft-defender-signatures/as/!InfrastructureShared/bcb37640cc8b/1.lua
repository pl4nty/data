-- Threat: !InfrastructureShared
-- Name: bcb37640cc8b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3.image_path ~= nil and l_0_3.ppid ~= nil then
    TrackPidAndTechniqueBM(l_0_3.ppid, "T1021.006", "wsmprovhost_childproc")
  end
end
return mp.CLEAN
