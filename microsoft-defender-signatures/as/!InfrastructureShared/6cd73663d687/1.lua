-- Threat: !InfrastructureShared
-- Name: 6cd73663d687
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "w3wp.exe" and IsSharepointServer() then
    return mp.INFECTED
  end
end
return mp.CLEAN
