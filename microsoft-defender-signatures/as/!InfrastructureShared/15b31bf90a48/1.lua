-- Threat: !InfrastructureShared
-- Name: 15b31bf90a48
-- Type: 21

local l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(bm.get_imagepath()))
if string.find(l_0_0, "\\windows\\system32\\winlogon.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_4.image_path ~= nil then
    l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_4.image_path))
    if string.find(l_0_0, "\\windows\\system32\\winlogon.exe", 1, true) then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
