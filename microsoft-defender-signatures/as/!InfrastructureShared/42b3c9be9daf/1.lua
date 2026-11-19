-- Threat: !InfrastructureShared
-- Name: 42b3c9be9daf
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and (string.match(l_0_0, "/bin/%a*sh") or string.find(l_0_0, "perl", 1, true) or string.find(l_0_0, "python", 1, true) or string.sub(l_0_0, 0, 6) == "/home/" or string.sub(l_0_0, 0, 6) == "/root/" or string.sub(l_0_0, 0, 5) == "/opt/" or string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 11) == "/usr/share/") then
  return mp.INFECTED
end
return mp.CLEAN
