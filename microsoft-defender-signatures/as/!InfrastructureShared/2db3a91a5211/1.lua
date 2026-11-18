-- Threat: !InfrastructureShared
-- Name: 2db3a91a5211
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  l_0_0 = string.lower(l_0_0)
  if string.match(l_0_0, "/s") == nil or string.match(l_0_0, "/i") == nil or string.match(l_0_0, "\\\\sysvol\\policies") == nil then
    return mp.CLEAN
  else
    return mp.INFECTED
  end
end
return mp.CLEAN
