-- Threat: !InfrastructureShared
-- Name: 2f9b3529c2f42
-- Type: 21

local l_0_0
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
local l_0_1 = this_sigattrlog[1].utf8p1
if l_0_0 and l_0_1 then
  local l_0_2 = string.lower(l_0_1)
  if string.find(l_0_0, l_0_2, 1, true) then
    if string.find(l_0_2, ":\\programdata\\", 1, true) then
      local l_0_3, l_0_4 = string.match(l_0_2, "(.+\\)([^\\]+)$")
      if l_0_3 then
        if string.sub(l_0_3, -14) == ":\\programdata\\" then
          mp.ReportLowfi(l_0_1, 3958098698)
          return mp.INFECTED
        elseif string.sub(l_0_3, -24) == ":\\programdata\\microsoft\\" then
          mp.ReportLowfi(l_0_1, 1927453360)
          return mp.INFECTED
        end
      end
    elseif string.find(l_0_2, "\\appdata\\", 1, true) then
      local l_0_5, l_0_6 = string.match(l_0_2, "(.+\\)([^\\]+)$")
      if l_0_5 then
        if string.sub(l_0_5, -17) == "\\appdata\\roaming\\" then
          mp.ReportLowfi(l_0_1, 98937382)
          return mp.INFECTED
        elseif string.sub(l_0_5, -15) == "\\appdata\\local\\" then
          mp.ReportLowfi(l_0_1, 2608938885)
          return mp.INFECTED
        elseif string.sub(l_0_5, -18) == "\\appdata\\locallow\\" then
          mp.ReportLowfi(l_0_1, 3968208659)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
