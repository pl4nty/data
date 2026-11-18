-- Threat: !InfrastructureShared
-- Name: 157d7a525c1ca
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
local l_0_2 = string.sub(l_0_1, -15):match("\\([^\\]+)$")
local l_0_3 = {
  ["wsusservice.exe"] = true,
  ["w3wp.exe"] = true
}
if l_0_3[l_0_2] then
  return mp.INFECTED
end
return mp.CLEAN
