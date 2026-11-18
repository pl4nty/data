-- Threat: !InfrastructureShared
-- Name: 4fd75428599f
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil and l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
local l_0_2 = l_0_1:match("([^\\]+)$")
local l_0_3 = {
  ["explorer.exe"] = true
}
if l_0_3[l_0_2] then
  return mp.INFECTED
end
return mp.CLEAN
