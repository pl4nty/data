-- Threat: !InfrastructureShared
-- Name: !#ALF:Linux/BlackCat.O
-- Type: 13
-- MpAttributes: BM_ELF_FILE

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
  "/proc/",
  "/sbin/"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_0:sub(1, #l_0_3) == l_0_3 then
    return mp.CLEAN
  end
end
local l_0_4 = {
  "/ansible",
  "/snap/",
  "/splunkd/",
  "/oracle/",
  "-salt-",
  "/tmp/go-build",
  "/var/intel",
  "/var/cache",
  "/var/arcticwolfnetworks",
  "/jenkins",
  "/filebeat",
  ".kubectl",
  "clamav-",
  ".tivoli",
  "containerd-shim",
  "docker-",
  "influx_",
  "influxd",
  "terraform-",
  "zscaler-",
  "/tmp/apt-key-gpg",
  "common-setup-and-utils-script.sh",
  "mdatp-edr-mitre-setup.sh",
  "mdatp-epp-mitre-setup.sh",
  "amazon-ssm-agent"
}
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if string.find(l_0_0, l_0_6, 1, true) then
    return mp.CLEAN
  end
end
local l_0_7 = {
  "/app/controller",
  "/app/payload"
}
for l_0_8, l_0_9 in ipairs(l_0_7) do
  if l_0_0:sub(-1 * #l_0_9) == l_0_9 then
    return mp.INFECTED
  end
end
return mp.CLEAN
