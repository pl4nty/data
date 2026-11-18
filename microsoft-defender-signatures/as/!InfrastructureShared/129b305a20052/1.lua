-- Threat: !InfrastructureShared
-- Name: 129b305a20052
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p1
end
if this_sigattrlog[9].matched and this_sigattrlog[9].wp2 ~= nil then
  l_0_1 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].wp2 ~= nil then
  l_0_1 = this_sigattrlog[10].utf8p2
end

function checkTaint()
  if (string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 9) == "/dev/shm/") and isTainted(l_0_0, "remote_file_created_taint") then
    return true
  end
  return false
end

if l_0_1 ~= nil then
  if string.find(l_0_1, "-perm", 1, true) and (string.match(l_0_1, "(%s)[-/](0*)200[07]") or string.match(l_0_1, "(%s)-(0*)400[07]") or string.match(l_0_1, "(%s)-(0*)6000") or string.match(l_0_1, "(%s)-(0*)222") or string.match(l_0_1, "(%s)-(0*)0002") or string.find(l_0_1, "u=s", 1, true) or string.find(l_0_1, "g=s", 1, true) or string.find(l_0_1, "-o w", 1, true) or string.find(l_0_1, "-o x", 1, true)) then
    if checkTaint() == true then
      return mp.INFECTED
    end
  elseif string.find(l_0_1, " -writable ", 1, true) and (string.match(l_0_1, "(%s)-type%s+[fd]") or string.find(l_0_1, "-not -user", 1, true)) and checkTaint() then
    return mp.INFECTED
  end
end
return mp.CLEAN
