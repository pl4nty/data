-- Threat: !InfrastructureShared
-- Name: 101d76b0be6cd
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "\\webhelpdesk\\bin\\", 1, true) and string.find(l_0_1, "java.exe", -8, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
