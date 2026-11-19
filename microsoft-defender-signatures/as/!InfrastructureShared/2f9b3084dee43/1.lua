-- Threat: !InfrastructureShared
-- Name: 2f9b3084dee43
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
end
l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
if l_0_0 and l_0_1 and string.find(l_0_0, l_0_1, 1, true) then
  if string.find(l_0_1, "\\appdata\\", 1, true) then
    local l_0_2, l_0_3 = string.match(l_0_1, "(.+\\)([^\\]+)$")
    if l_0_2 then
      if string.sub(l_0_2, -27) == "\\appdata\\roaming\\microsoft\\" then
        return mp.INFECTED
      elseif string.sub(l_0_2, -35) == "\\appdata\\roaming\\microsoft\\windows\\" then
        return mp.INFECTED
      end
    end
  elseif string.find(l_0_1, ":\\programdata\\", 1, true) then
    local l_0_4, l_0_5 = string.match(l_0_1, "(.+\\)([^\\]+)$")
    if l_0_4 and string.sub(l_0_4, -24) == ":\\programdata\\microsoft\\" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
