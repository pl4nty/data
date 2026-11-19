-- Threat: !InfrastructureShared
-- Name: c4b325cff0fd
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 then
  l_0_0 = string.lower(l_0_0)
  l_0_0 = l_0_0:gsub("\\shell\\open\\command", "")
  local l_0_1 = sysio.RegExpandUserKey(l_0_0)
  for l_0_2, l_0_3 in pairs(l_0_1) do
    AppendToRollingQueue("PoshevinRelatedRegistries", l_0_3, nil, 5000)
  end
end
local l_0_4 = string.lower(bm.get_imagepath())
if l_0_4 then
  AppendToRollingQueue("PoshevinRelatedFiles", l_0_4, nil, 5000)
end
local l_0_5, l_0_6 = bm.get_process_relationships()
if l_0_6 ~= nil then
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    if l_0_8.image_path ~= nil and l_0_8.ppid ~= nil then
      TrackPidAndTechniqueBM(l_0_8.ppid, "T1037", "possible_poshevin_child_d")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
