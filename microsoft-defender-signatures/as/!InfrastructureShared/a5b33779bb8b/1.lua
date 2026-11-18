-- Threat: !InfrastructureShared
-- Name: a5b33779bb8b
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
end
if this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
end
if this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
end
if this_sigattrlog[7].matched then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
end
if this_sigattrlog[8].matched then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p2)
end
if l_0_0 ~= nil and string.find(l_0_0, "\" ..") then
  l_0_1 = string.gsub(l_0_0, " ..", "")
  l_0_2 = string.gsub(l_0_1, "\"", "")
  mp.ReportLowfi(l_0_1, 138103733)
  mp.ReportLowfi(l_0_2, 138103733)
  return mp.INFECTED
end
return mp.INFECTED
