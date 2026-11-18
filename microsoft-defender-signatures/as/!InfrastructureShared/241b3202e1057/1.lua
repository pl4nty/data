-- Threat: !InfrastructureShared
-- Name: 241b3202e1057
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[6].matched then
  l_0_1 = this_sigattrlog[6].utf8p1
  if l_0_1 then
    l_0_1 = string.lower(l_0_1)
    if l_0_1 then
      l_0_0 = string.len(l_0_1)
      if 16 <= l_0_0 then
        local l_0_2, l_0_3 = string.match(l_0_1, "^%l:\\(%w+)\\(%w+)%.exe")
        if l_0_2 ~= nil and l_0_3 ~= nil and l_0_2 == l_0_3 then
          bm.add_related_file(this_sigattrlog[6].utf8p1)
          return mp.INFECTED
        end
      end
    end
  end
elseif this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].utf8p1
  if l_0_1 then
    l_0_1 = string.lower(l_0_1)
    if l_0_1 then
      l_0_0 = string.len(l_0_1)
      if 16 <= l_0_0 then
        local l_0_4, l_0_5 = string.match(l_0_1, "^%l:\\(%w+)\\(%w+)%.dll")
        if l_0_4 ~= nil and l_0_5 ~= nil and l_0_4 == l_0_5 then
          bm.add_related_file(this_sigattrlog[7].utf8p1)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
