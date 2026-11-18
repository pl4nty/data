-- Threat: !InfrastructureShared
-- Name: 43b3b4a52cf8
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil then
  local l_0_1 = l_0_0.command_line
  if string.find(l_0_1, "rundll32", 1, true) ~= nil and l_0_1 ~= nil then
    local l_0_2 = extractDllForRegproc(l_0_1)
    if l_0_2 and checkFileLastWriteTime(l_0_2, 600) == false and mp.IsKnownFriendlyFile(l_0_2, true, false) == false then
      bm.add_related_file(l_0_2)
    end
  end
end
return mp.INFECTED
