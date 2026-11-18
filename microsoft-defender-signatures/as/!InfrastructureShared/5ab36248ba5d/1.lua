-- Threat: !InfrastructureShared
-- Name: 5ab36248ba5d
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = string.gmatch(l_0_0, "::readallbytes%(['\"](.+)['\"]%)")
  for l_0_2 in l_0_1, nil, nil do
    if sysio.IsFileExists(l_0_2) then
      bm.add_related_file(l_0_2)
    end
  end
end
return mp.INFECTED
