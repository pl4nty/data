-- Threat: !InfrastructureShared
-- Name: 27cb359363191
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[12].matched then
  l_0_2 = this_sigattrlog[12].utf8p1
  local l_0_3 = l_0_2:match("([^\\]+)$") or ""
  local l_0_4, l_0_5 = l_0_3:match("^(.+)%.([^%.]+)$")
  if not l_0_5 or not contains(string.lower(l_0_5), {"exe", "dll"}) then
    return mp.CLEAN
  end
end
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p2
  l_0_0 = this_sigattrlog[3].utf8p1
end
if this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].utf8p2
  l_0_0 = this_sigattrlog[4].utf8p1
end
if this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].utf8p2
  l_0_0 = this_sigattrlog[5].utf8p1
end
if this_sigattrlog[6].matched then
  l_0_1 = this_sigattrlog[6].utf8p2
  l_0_0 = this_sigattrlog[6].utf8p1
end
if this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].utf8p2
  l_0_0 = this_sigattrlog[7].utf8p1
end
if this_sigattrlog[8].matched then
  l_0_1 = this_sigattrlog[8].utf8p2
  l_0_0 = this_sigattrlog[8].utf8p1
end
if this_sigattrlog[9].matched then
  l_0_1 = this_sigattrlog[9].utf8p2
  l_0_0 = this_sigattrlog[9].utf8p1
end
if this_sigattrlog[10].matched then
  l_0_1 = this_sigattrlog[10].utf8p2
  l_0_0 = this_sigattrlog[10].utf8p1
end
if this_sigattrlog[11].matched then
  l_0_1 = this_sigattrlog[11].utf8p2
  l_0_0 = this_sigattrlog[11].utf8p1
end
if not (l_0_2 and l_0_1) or not l_0_0 then
  return mp.CLEAN
end
bm.add_related_string("InjectionType", l_0_1, bm.RelatedStringBMReport)
bm.add_related_string("InjectedIn", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("File_Created", l_0_2, bm.RelatedStringBMReport)
return mp.INFECTED
