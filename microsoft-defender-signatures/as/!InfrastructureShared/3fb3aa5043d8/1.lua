-- Threat: !InfrastructureShared
-- Name: 3fb3aa5043d8
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 and string.len(l_0_0) > 48 and string.find(l_0_0, "%.%.\\") then
    l_0_0 = string.lower(l_0_0)
    if string.find(l_0_0, "javascript:", 2, true) or string.find(l_0_0, "vbscript:", 2, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
