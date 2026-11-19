-- Threat: !InfrastructureShared
-- Name: 8bb3974f09b1
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].image_path
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].image_path
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].image_path
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if 18 <= #l_0_0 and l_0_0:find("\\windows\\system32\\", 1, true) == nil and l_0_0:find("\\windows\\syswow64\\", 1, true) == nil then
  return mp.INFECTED
end
if 13 <= #l_0_0 and l_0_0:sub(-13) ~= "\\schtasks.exe" then
  return mp.INFECTED
end
return mp.CLEAN
