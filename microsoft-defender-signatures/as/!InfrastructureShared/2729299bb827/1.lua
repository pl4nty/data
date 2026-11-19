-- Threat: !InfrastructureShared
-- Name: 2729299bb827
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 2500 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_1:match("\"preinstall\"%s*:%s*\"(.-[^\\])\"")
if l_0_2 == nil or #l_0_2 == 0 then
  return mp.CLEAN
end
if not string.find(l_0_2, "curl ", 1, true) and not string.find(l_0_2, "wget ", 1, true) then
  return mp.CLEAN
end
if (string.find(l_0_2, "(uname -s)", 1, true) or string.find(l_0_2, "pwd", 1, true)) and string.find(l_0_2, "whoami", 1, true) and string.find(l_0_2, "hostname", 1, true) then
  return mp.INFECTED
end
if not l_0_2:match(";%s*rm%s+%$[%w_]+") or not string.find(l_0_2, "-x post ", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_2, "metadata.google.internal", 1, true) or string.find(l_0_2, "://webhook.site/", 1, true) or string.find(l_0_2, "/docker.sock", 1, true) and string.find(l_0_2, " mount /", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
