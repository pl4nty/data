-- Threat: !InfrastructureShared
-- Name: 51b39eb6268d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3.image_path ~= nil and l_0_3.ppid ~= nil then
      TrackPidAndTechniqueBM(l_0_3.ppid, "T1218", "msdt_pcwdiag_target")
    end
  end
end
return mp.INFECTED
