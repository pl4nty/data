-- Threat: !InfrastructureShared
-- Name: 4dd79efef45f
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") == "spoolsv.exe" then
  return mp.INFECTED
end
return mp.CLEAN
