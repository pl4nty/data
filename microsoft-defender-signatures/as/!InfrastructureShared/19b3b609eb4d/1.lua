-- Threat: !InfrastructureShared
-- Name: 19b3b609eb4d
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 ~= nil and string.len(l_0_0) > 3 then
    local l_0_1 = string.lower(bm.get_imagepath())
    local l_0_2
    if l_0_1 ~= nil and string.len(l_0_1) > 3 then
      l_0_2 = string.match(l_0_1, "(.-)[^\\]-[^\\%.]+$")
    end
    for l_0_3 in string.gmatch(l_0_0, "%S+") do
      if sysio.IsFileExists(l_0_3) then
        bm.add_related_file(l_0_3)
      elseif l_0_2 ~= nil and string.len(l_0_2) > 3 then
        local l_0_4 = l_0_2 .. l_0_3
        if sysio.IsFileExists(l_0_4) then
          bm.add_related_file(l_0_3)
        end
      end
    end
  end
end
return mp.INFECTED
