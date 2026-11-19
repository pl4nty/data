-- Threat: !InfrastructureShared
-- Name: 19bb309bd4b73
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  AppendToRollingQueue("PoshevinRelatedFiles", l_0_0, nil, 5000)
end
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_2 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if l_0_4.image_path ~= nil and l_0_4.ppid ~= nil then
      TrackPidAndTechniqueBM(l_0_4.ppid, "T1037", "possible_poshevin_child_a")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
