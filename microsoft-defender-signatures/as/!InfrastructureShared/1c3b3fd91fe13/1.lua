-- Threat: !InfrastructureShared
-- Name: 1c3b3fd91fe13
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
end
l_0_1 = this_sigattrlog[1].utf8p1
if l_0_0 and l_0_1 and string.find(l_0_0, string.lower(l_0_1), 1, true) and string.find(string.lower(l_0_1), "\\appdata\\roaming\\microsoft", 1, true) then
  local l_0_2, l_0_3 = string.match(string.lower(l_0_1), "(.+\\)([^\\]+)$")
  if l_0_2 then
    if string.sub(l_0_2, -27) == "\\appdata\\roaming\\microsoft\\" then
      mp.ReportLowfi(l_0_1, 2978130009)
      return mp.INFECTED
    elseif string.sub(l_0_2, -35) == "\\appdata\\roaming\\microsoft\\windows\\" then
      mp.ReportLowfi(l_0_1, 680262115)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
