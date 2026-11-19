-- Threat: !InfrastructureShared
-- Name: e8b3d0801c76
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if not l_0_0:match("/s[%s]?$") then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p1
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p1
end
if l_0_1 then
  l_0_1 = string.lower(l_0_1)
  AppendToRollingQueue("PoshevinRelatedFiles", l_0_1, nil, 5000)
end
local l_0_2 = string.lower(bm.get_imagepath())
if l_0_2 then
  AppendToRollingQueue("PoshevinRelatedFiles", l_0_2, nil, 5000)
end
local l_0_3, l_0_4 = bm.get_process_relationships()
if l_0_4 ~= nil then
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    if l_0_6.image_path ~= nil and l_0_6.ppid ~= nil then
      TrackPidAndTechniqueBM(l_0_6.ppid, "T1037", "possible_poshevin_child_b")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
