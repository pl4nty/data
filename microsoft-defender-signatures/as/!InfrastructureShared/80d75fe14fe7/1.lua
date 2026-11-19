-- Threat: !InfrastructureShared
-- Name: 80d75fe14fe7
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "explorer.exe" or l_0_1:match("([^\\]+)$") == "conhost.exe" or l_0_1:match("([^\\]+)$") == "cmd.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
