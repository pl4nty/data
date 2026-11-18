-- Threat: !InfrastructureShared
-- Name: 1f7b343088b36
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if l_0_0 and string.find(string.lower(l_0_0), "\\appdata\\roaming\\microsoft", 1, true) then
  local l_0_1, l_0_2 = string.match(string.lower(l_0_0), "(.+\\)([^\\]+)$")
  if l_0_1 then
    if string.sub(l_0_1, -27) == "\\appdata\\roaming\\microsoft\\" then
      mp.ReportLowfi(l_0_0, 3312250037)
      return mp.INFECTED
    elseif string.sub(l_0_1, -35) == "\\appdata\\roaming\\microsoft\\windows\\" then
      mp.ReportLowfi(l_0_0, 1550171407)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
