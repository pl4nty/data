-- Threat: !InfrastructureShared
-- Name: 3d8c83f9fcb6
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = {
  "/usr/",
  "/var/lib/",
  "/bin/",
  "/var/log/",
  "/var/opt/",
  "/opt/",
  "/etc/",
  "/snap/",
  "/sbin/",
  "/proc/"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_0:sub(1, #l_0_3) == l_0_3 then
    return mp.CLEAN
  end
end
local l_0_4 = {
  "/usr/bin/snap",
  "/amazon-ssm-agent/",
  "/snapd/snap-exec"
}
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if string.find(l_0_0, l_0_6, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
