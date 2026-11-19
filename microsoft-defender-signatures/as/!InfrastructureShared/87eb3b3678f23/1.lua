-- Threat: !InfrastructureShared
-- Name: 87eb3b3678f23
-- Type: 21

local l_0_0
if this_sigattrlog[17].matched then
  l_0_0 = string.lower(this_sigattrlog[17].utf8p1)
end
if l_0_0 ~= nil then
  local l_0_1 = string.sub(l_0_0, -4)
  local l_0_2 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_2, l_0_1, 1, true) then
    mp.ReportLowfi(l_0_0, 3394984378)
    bm.add_related_file(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
