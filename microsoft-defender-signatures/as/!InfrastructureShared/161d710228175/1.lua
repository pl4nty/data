-- Threat: !InfrastructureShared
-- Name: 161d710228175
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "node.exe" or l_0_1:match("([^\\]+)$") == "npm.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
