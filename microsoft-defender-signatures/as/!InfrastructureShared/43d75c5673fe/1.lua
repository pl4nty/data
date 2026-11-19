-- Threat: !InfrastructureShared
-- Name: 43d75c5673fe
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path == nil or l_0_0.image_path == "" then
  return mp.CLEAN
end
if contains(l_0_0.image_path, "psexesvc") then
  return mp.INFECTED
end
return mp.CLEAN
