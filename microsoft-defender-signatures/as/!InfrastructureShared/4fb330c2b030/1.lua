-- Threat: !InfrastructureShared
-- Name: 4fb330c2b030
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= "" then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "domain ", 1, true) and string.find(l_0_0, "user ", 1, true) and string.find(l_0_0, "pass ", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
