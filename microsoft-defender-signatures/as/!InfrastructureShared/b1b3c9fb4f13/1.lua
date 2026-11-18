-- Threat: !InfrastructureShared
-- Name: b1b3c9fb4f13
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and string.lower(string.sub(l_0_3.image_path, -12)) == "\\control.exe" then
    return mp.CLEAN
  end
  if l_0_3.cmd_line ~= nil and string.match(string.lower(l_0_3.cmd_line), ".cpl$") then
    return mp.CLEAN
  end
end
return mp.INFECTED
