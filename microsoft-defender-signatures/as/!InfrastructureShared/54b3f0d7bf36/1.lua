-- Threat: !InfrastructureShared
-- Name: 54b3f0d7bf36
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  if l_0_0 ~= nil and string.len(l_0_0) > 3 then
    if string.find(l_0_0, ".msc", 1, true) or string.find(l_0_0, "\\biztalk", 1, true) or string.find(l_0_0, "\\program files", 1, true) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
