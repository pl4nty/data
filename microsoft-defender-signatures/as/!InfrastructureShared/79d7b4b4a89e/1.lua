-- Threat: !InfrastructureShared
-- Name: 79d7b4b4a89e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) and string.find(l_0_0.image_path, "/node", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
