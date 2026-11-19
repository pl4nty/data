-- Threat: !InfrastructureShared
-- Name: 2db398b5eaf4
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if this_sigattrlog[2].matched then
    local l_0_1 = this_sigattrlog[2].utf8p1
    local l_0_2 = string.lower(string.match(l_0_0, "(.-)[^\\]-[^\\%.]+$"))
    local l_0_3 = string.lower(string.match(l_0_1, "(.-)[^\\]-[^\\%.]+$"))
    if l_0_2 == l_0_3 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
