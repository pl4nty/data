-- Threat: !InfrastructureShared
-- Name: 6ed702dffecf
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(string.sub(l_0_0.image_path, -11))
if l_0_1 ~= "svchost.exe" then
  return mp.CLEAN
end
local l_0_2 = versioning.GetLocaleIdentifier()
if l_0_2 == 1049 then
  return mp.LOWFI
end
return mp.CLEAN
