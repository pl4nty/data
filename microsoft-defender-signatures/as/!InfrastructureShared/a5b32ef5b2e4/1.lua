-- Threat: !InfrastructureShared
-- Name: a5b32ef5b2e4
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= "" then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "-r ", 1, true) and string.find(l_0_0, "init", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
