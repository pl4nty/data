-- Threat: !InfrastructureShared
-- Name: 55b35979d864
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 == nil then
  return mp.CLEAN
end
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = string.lower(string.sub(l_0_3.image_path, -15)):match("\\([^\\]+)$")
    local l_0_5 = {
      ["svchost.exe"] = true,
      ["taskhostw.exe"] = true,
      ["taskeng.exe"] = true
    }
    if l_0_5[l_0_4] then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
