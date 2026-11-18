-- Threat: !InfrastructureShared
-- Name: 5cfb3726a000b
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[7].matched then
  if this_sigattrlog[7].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[7].utf8p1
  end
  if this_sigattrlog[7].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[7].utf8p2
  end
elseif this_sigattrlog[8].matched then
  if this_sigattrlog[8].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[8].utf8p1
  end
  if this_sigattrlog[8].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[8].utf8p2
  end
elseif this_sigattrlog[9].matched then
  if this_sigattrlog[9].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[9].utf8p1
  end
  if this_sigattrlog[9].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[9].utf8p2
  end
elseif this_sigattrlog[10].matched then
  if this_sigattrlog[10].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[10].utf8p1
  end
  if this_sigattrlog[10].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[10].utf8p2
  end
elseif this_sigattrlog[11].matched then
  if this_sigattrlog[11].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[11].utf8p1
  end
  if this_sigattrlog[11].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[11].utf8p2
  end
elseif this_sigattrlog[12].matched then
  if this_sigattrlog[12].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[12].utf8p1
  end
  if this_sigattrlog[12].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[12].utf8p2
  end
elseif this_sigattrlog[13].matched then
  if this_sigattrlog[13].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[13].utf8p1
  end
  if this_sigattrlog[13].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[13].utf8p2
  end
elseif this_sigattrlog[15].matched then
  if this_sigattrlog[15].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[15].utf8p1
  end
  if this_sigattrlog[15].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[15].utf8p2
  end
elseif this_sigattrlog[16].matched then
  if this_sigattrlog[16].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[16].utf8p1
  end
  if this_sigattrlog[16].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[16].utf8p2
  end
elseif this_sigattrlog[17].matched then
  if this_sigattrlog[17].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[17].utf8p1
  end
  if this_sigattrlog[17].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[17].utf8p2
  end
elseif this_sigattrlog[18].matched then
  if this_sigattrlog[18].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[18].utf8p1
  end
  if this_sigattrlog[18].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[18].utf8p2
  end
elseif this_sigattrlog[19].matched then
  if this_sigattrlog[19].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[19].utf8p1
  end
  if this_sigattrlog[19].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[19].utf8p2
  end
elseif this_sigattrlog[20].matched then
  if this_sigattrlog[20].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[20].utf8p1
  end
  if this_sigattrlog[20].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[20].utf8p2
  end
elseif this_sigattrlog[14].matched then
  if this_sigattrlog[14].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[14].utf8p1
  end
  if this_sigattrlog[14].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[14].utf8p2
  end
end
local l_0_2 = "\\scoop\\persist\\"
if l_0_0 ~= nil and string.find(string.lower(l_0_0), l_0_2, 1, true) then
  return mp.CLEAN
end
if l_0_1 ~= nil and string.find(string.lower(l_0_1), l_0_2, 1, true) then
  return mp.CLEAN
end
if l_0_0 ~= nil and string.find(string.lower(l_0_0), "freecad\\webdata\\persistent\\network", 1, true) then
  return mp.CLEAN
end
if l_0_1 ~= nil and string.find(string.lower(l_0_1), "freecad\\v1-1\\webdata\\persistent\\network", 1, true) then
  return mp.CLEAN
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
  bm.add_threat_file(l_0_1)
  bm.add_related_file(l_0_1)
end
return mp.INFECTED
