-- Threat: !InfrastructureShared
-- Name: 35b3d5aa7763
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  local l_0_4 = string.lower(string.match(l_0_3.image_path, "\\([^\\]+)$"))
  if l_0_4 == "java.exe" or l_0_4 == "javaw.exe" then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
