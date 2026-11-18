-- Threat: !InfrastructureShared
-- Name: 6bd7bbbfdd95
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(string.sub(l_0_0.image_path, -12))
if l_0_1 ~= "explorer.exe" then
  return mp.CLEAN
end
return mp.LOWFI
