-- Threat: !InfrastructureShared
-- Name: 557b343a5367c
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  if this_sigattrlog[1].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[1].utf8p1
  end
  if this_sigattrlog[1].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[1].utf8p2
  end
elseif this_sigattrlog[2].matched then
  if this_sigattrlog[2].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[2].utf8p1
  end
  if this_sigattrlog[2].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[2].utf8p2
  end
elseif this_sigattrlog[3].matched then
  if this_sigattrlog[3].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[3].utf8p1
  end
  if this_sigattrlog[3].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[3].utf8p2
  end
elseif this_sigattrlog[4].matched then
  if this_sigattrlog[4].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[4].utf8p1
  end
  if this_sigattrlog[4].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[4].utf8p2
  end
elseif this_sigattrlog[5].matched then
  if this_sigattrlog[5].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[5].utf8p1
  end
  if this_sigattrlog[5].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[5].utf8p2
  end
elseif this_sigattrlog[6].matched then
  if this_sigattrlog[6].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[6].utf8p1
  end
  if this_sigattrlog[6].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[6].utf8p2
  end
elseif this_sigattrlog[7].matched then
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
elseif this_sigattrlog[14].matched then
  if this_sigattrlog[14].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[14].utf8p1
  end
  if this_sigattrlog[14].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[14].utf8p2
  end
end
local l_0_2 = string.lower(bm.get_imagepath())
if l_0_2:find("browser", 1, true) then
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
