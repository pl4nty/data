-- Threat: !InfrastructureShared
-- Name: d5b38a874c82
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  if string.find(l_0_0, "--lm=", 1, true) and string.find(l_0_0, "--nt=", 1, true) then
    return mp.INFECTED
  end
  if string.find(l_0_0, "-hashes ", 1, true) then
    return mp.INFECTED
  end
  if string.find(l_0_0, "-u ", 1, true) and string.find(l_0_0, "-x ", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
