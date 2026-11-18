-- Threat: !InfrastructureShared
-- Name: 145b37a40c8d0
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0
  if this_sigattrlog[2].matched then
    l_0_0 = this_sigattrlog[2].utf8p2
  elseif this_sigattrlog[3].matched then
    l_0_0 = this_sigattrlog[3].utf8p2
  elseif this_sigattrlog[4].matched then
    l_0_0 = this_sigattrlog[4].utf8p2
  elseif this_sigattrlog[5].matched then
    l_0_0 = this_sigattrlog[5].utf8p2
  elseif this_sigattrlog[6].matched then
    l_0_0 = this_sigattrlog[6].utf8p2
  elseif this_sigattrlog[7].matched then
    l_0_0 = this_sigattrlog[7].utf8p2
  elseif this_sigattrlog[8].matched then
    l_0_0 = this_sigattrlog[8].utf8p2
  elseif this_sigattrlog[9].matched then
    l_0_0 = this_sigattrlog[9].utf8p2
  elseif this_sigattrlog[10].matched then
    l_0_0 = this_sigattrlog[10].utf8p2
  elseif this_sigattrlog[11].matched then
    l_0_0 = this_sigattrlog[11].utf8p2
  elseif this_sigattrlog[12].matched then
    l_0_0 = this_sigattrlog[12].utf8p2
  elseif this_sigattrlog[13].matched then
    l_0_0 = this_sigattrlog[13].utf8p2
  elseif this_sigattrlog[14].matched then
    l_0_0 = this_sigattrlog[14].utf8p2
  elseif this_sigattrlog[15].matched then
    l_0_0 = this_sigattrlog[15].utf8p2
  elseif this_sigattrlog[16].matched then
    l_0_0 = this_sigattrlog[16].utf8p2
  end
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = this_sigattrlog[1].utf8p2
  if not l_0_1 then
    return mp.CLEAN
  end
  if l_0_1 == l_0_0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
