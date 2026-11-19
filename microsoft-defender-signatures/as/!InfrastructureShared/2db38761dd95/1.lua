-- Threat: !InfrastructureShared
-- Name: 2db38761dd95
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
      local l_0_4 = string.match(l_0_3, "([^\\]-)[^\\%.]+$") .. "xoml"
      if sysio.IsFileExists(l_0_3) then
        bm.add_related_file(l_0_3)
        if sysio.IsFileExists(l_0_4) then
          bm.add_related_file(l_0_4)
        end
      elseif l_0_2 ~= nil and string.len(l_0_2) > 3 then
        local l_0_5 = l_0_2 .. l_0_3
        if sysio.IsFileExists(l_0_5) then
          bm.add_related_file(l_0_3)
        end
        local l_0_6 = l_0_2 .. l_0_4
        if sysio.IsFileExists(l_0_6) then
          bm.add_related_file(l_0_6)
        end
      end
    end
  end
end
bm.add_action("EmsScan", 20000)
return mp.INFECTED
