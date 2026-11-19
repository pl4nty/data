-- Threat: !InfrastructureShared
-- Name: 19b3f6168d34
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if string.find(string.lower(l_0_0), "\\microsoft\\windows\\wer\\report", 1, true) == nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
