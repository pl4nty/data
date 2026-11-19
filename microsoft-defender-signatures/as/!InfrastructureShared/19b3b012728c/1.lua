-- Threat: !InfrastructureShared
-- Name: 19b3b012728c
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
  l_0_1 = "MaliciousNPMPackage"
end
if l_0_1 ~= nil and l_0_0 ~= nil then
  local l_0_2 = {}
  table.insert(l_0_2, {Context = l_0_1, PackageInfo = l_0_0})
  if 0 < #l_0_2 then
    bm.set_detection_string(safeJsonSerialize(l_0_2))
    return mp.INFECTED
  end
end
return mp.CLEAN
