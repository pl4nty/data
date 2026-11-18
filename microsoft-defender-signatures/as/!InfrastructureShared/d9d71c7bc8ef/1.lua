-- Threat: !InfrastructureShared
-- Name: d9d71c7bc8ef
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0.image_path, -7))
  if l_0_1 == "cmd.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
