-- Threat: !InfrastructureShared
-- Name: 17e41012fbde2
-- Type: 21

if this_sigattrlog[9].matched and this_sigattrlog[10].matched then
  local l_0_0 = string.lower(this_sigattrlog[9].p1)
  local l_0_1 = string.lower(this_sigattrlog[10].p1)
  if l_0_0:match("c:\\temp\\(%l+)%.zip") == l_0_1:match("c:\\temp\\%l+%.(%l+)") then
    return mp.INFECTED
  end
end
return mp.CLEAN
