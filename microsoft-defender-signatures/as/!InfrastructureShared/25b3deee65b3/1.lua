-- Threat: !InfrastructureShared
-- Name: 25b3deee65b3
-- Type: 21

local l_0_0 = string.match(this_sigattrlog[1].utf8p1, "\\([%x]+)$")
if l_0_0 and string.len(l_0_0) > 31 then
  local l_0_1 = mp.GetMachineGUID()
  if l_0_1 and l_0_1 == "E7000F4C-E95C-400D-8EAB-37FF728B4EF2" then
    if this_sigattrlog[1].matched then
      local l_0_2 = this_sigattrlog[1].utf8p1
      if l_0_2 then
        l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_2)
        bm.add_related_file(l_0_2)
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
