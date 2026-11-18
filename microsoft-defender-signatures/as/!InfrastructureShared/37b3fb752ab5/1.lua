-- Threat: !InfrastructureShared
-- Name: 37b3fb752ab5
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = string.match(l_0_0, "cmd%.exe\".+\"(.+%.bat?\"-)")
  if sysio.IsFileExists(l_0_1) then
    mp.ReportLowfi(l_0_1, 2666131225)
  end
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_2 = this_sigattrlog[2].utf8p1
  if sysio.IsFileExists(l_0_2) then
    mp.ReportLowfi(l_0_2, 1017542064)
  end
end
return mp.INFECTED
