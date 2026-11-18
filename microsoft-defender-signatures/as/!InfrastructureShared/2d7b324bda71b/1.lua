-- Threat: !InfrastructureShared
-- Name: 2d7b324bda71b
-- Type: 21

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
end
if this_sigattrlog[7].matched and this_sigattrlog[7].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
end
if l_0_0 ~= nil then
  if string.find(l_0_0, "/nagios/plugins/", 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_0, "--lm", 1, true) and string.find(l_0_0, "--nt", 1, true) then
    return mp.INFECTED
  elseif string.find(l_0_0, "-c ", 1, true) and string.find(l_0_0, "-t ", 1, true) then
    return mp.INFECTED
  elseif string.find(l_0_0, "-c ", 1, true) and string.find(l_0_0, "-l ", 1, true) then
    return mp.INFECTED
  elseif string.find(l_0_0, "-u ", 1, true) and string.find(l_0_0, "-t ", 1, true) then
    return mp.INFECTED
  elseif string.find(l_0_0, "-u ", 1, true) and string.find(l_0_0, "-l ", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
