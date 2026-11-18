-- Threat: !InfrastructureShared
-- Name: 2db3b6fda71d
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = string.match(l_0_0, "wscript%.exe\".+\"(.+%.doc[x]?%.js\"-)")
  if l_0_1 ~= nil then
    mp.ReportLowfi(l_0_1 .. "\000", 2164430518)
    return mp.INFECTED
  end
end
if this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  local l_0_2 = string.lower(this_sigattrlog[2].utf8p2)
  local l_0_3 = string.match(l_0_2, "cscript%.exe\".+\"(.+%.doc[x]?%.js\"-)")
  if l_0_3 ~= nil then
    mp.ReportLowfi(l_0_3 .. "\000", 403425036)
    return mp.INFECTED
  end
end
return mp.CLEAN
