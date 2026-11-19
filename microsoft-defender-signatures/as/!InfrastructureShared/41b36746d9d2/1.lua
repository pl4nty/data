-- Threat: !InfrastructureShared
-- Name: 41b36746d9d2
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 ~= nil and string.len(l_0_0) > 4 and string.sub(l_0_0, -4) == ".lnk" then
    return mp.INFECTED
  end
end
return mp.CLEAN
