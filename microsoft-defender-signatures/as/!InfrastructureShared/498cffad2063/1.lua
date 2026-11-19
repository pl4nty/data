-- Threat: !InfrastructureShared
-- Name: 498cffad2063
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 20971520 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_2 = {
  "/usr/",
  "/var/lib/",
  "/bin/",
  "/var/log/",
  "/var/opt/",
  "/opt/",
  "/etc/",
  "/snap/",
  "/boot/",
  "/proc/"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if l_0_1:sub(1, #l_0_4) == l_0_4 then
    return mp.CLEAN
  end
end
local l_0_5 = {
  "/altair/",
  "-altair.",
  "oracle",
  "nessus",
  "siemens",
  "/ansys_",
  "/ansys/",
  "nginx",
  "/intel",
  "/yum/",
  "/dracut.",
  "/apt/",
  "/driver/",
  "/ossec",
  "/microsoft/",
  "/azuremonitoragent/",
  "/tivoli/",
  "/hdbkeystore",
  "/vmware",
  "-glibc2",
  "/splunkforwarder/bin/s3benchmark",
  "/nimldr",
  "/appdynamics/platform/",
  "wazuh",
  "/odbc",
  "libodbc",
  "icsagentdriver",
  "libunicomm.so",
  "broadcom",
  "fortiedr",
  "mystikos",
  "libcurl",
  "libssh",
  "commvault"
}
for l_0_6, l_0_7 in ipairs(l_0_5) do
  if string.find(l_0_1, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
