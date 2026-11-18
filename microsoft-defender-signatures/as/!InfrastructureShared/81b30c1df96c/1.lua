-- Threat: !InfrastructureShared
-- Name: 81b30c1df96c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "cmd.exe",
  "powershell.exe"
}
if IsProcNameInParentProcessTree("BM", l_0_0) then
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if l_0_4.image_path ~= nil then
      local l_0_5, l_0_6 = bm.get_process_relationships(l_0_4.ppid)
      for l_0_7, l_0_8 in ipairs(l_0_5) do
        if l_0_8.image_path ~= nil then
          bm.add_related_file(l_0_8.image_path)
        end
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
