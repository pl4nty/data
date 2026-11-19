-- Threat: !InfrastructureShared
-- Name: e2d7a754c75f
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(string.sub(l_0_0.image_path, -11))
if l_0_1 == "wscript.exe" then
  return mp.INFECTED
end
return mp.CLEAN
