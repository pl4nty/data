-- Threat: !InfrastructureShared
-- Name: 32b3623e35ac
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p1)
  if l_0_0:find(":\\users", 1, true) ~= nil or l_0_0:find(":\\windows", 1, true) ~= nil then
    if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
      bm.add_related_file(l_0_0)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
