-- Threat: !InfrastructureShared
-- Name: 25b342d3aec6
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.reason == 1 then
    if string.lower(string.match(l_0_3.image_path, "\\([^\\]+)$")) == "razerinstaller.exe" then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
