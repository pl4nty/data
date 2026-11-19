-- Threat: !InfrastructureShared
-- Name: 54b396614842
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 == nil then
  return mp.CLEAN
end
for l_0_2, l_0_3 in ipairs(l_0_0) do
  local l_0_4 = string.lower(l_0_3.image_path)
  if string.find(l_0_4, "\\svchost.exe", 1, true) or string.find(l_0_4, "\\services.exe") then
    return mp.INFECTED
  end
end
return mp.CLEAN
