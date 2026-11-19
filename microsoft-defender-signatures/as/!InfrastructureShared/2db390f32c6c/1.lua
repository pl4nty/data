-- Threat: !InfrastructureShared
-- Name: 2db390f32c6c
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 ~= nil and string.len(l_0_0) > 3 then
    local l_0_1 = string.lower(l_0_0)
    if string.find(l_0_1, "win32_release.dll", 1, true) ~= nil or string.find(l_0_1, "x64_release.dll", 1, true) ~= nil or string.find(l_0_1, "agent_dll.dll", 1, true) ~= nil or string.find(l_0_1, "umep", 1, true) ~= nil or string.find(l_0_1, "vfep", 1, true) ~= nil then
      bm_AddRelatedFileFromCommandLine(l_0_0)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
