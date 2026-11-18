-- Threat: !InfrastructureShared
-- Name: f3d755d0df2a
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "sqlservr.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
