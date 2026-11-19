-- Threat: !InfrastructureShared
-- Name: 5cd7b4b1a1dc
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "omadmclient.exe" or l_0_1:match("([^\\]+)$") == "provtool.exe" then
    return mp.CLEAN
  end
end
if versioning.IsSeville() and versioning.GetCloudBlockLevel() >= 4 then
  return mp.INFECTED
end
return mp.LOWFI
