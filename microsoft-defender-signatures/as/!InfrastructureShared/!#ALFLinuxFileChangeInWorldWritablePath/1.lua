-- Threat: !InfrastructureShared
-- Name: !#ALF:Linux/FileChangeInWorldWritablePath
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & (BM_ELF_FILE | BM_PY_FILE | Lua:PYExt | Lua:PHPExt | BM_PHP_FILE | Lua:SHExt | BM_SH_FILE | Lua:SCPTExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_1 == nil or 10485760 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or #l_0_2 < 4 then
  return mp.CLEAN
end
local l_0_3 = {
  "/var/tmp/mkinitramfs",
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
  "/var/tmp/dracut",
  "common-setup-and-utils-script.sh",
  "mdatp-edr-mitre-setup.sh",
  "mdatp-epp-mitre-setup.sh",
  "amazon-ssm-agent"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if string.find(l_0_2, l_0_5, 1, true) then
    return mp.CLEAN
  end
end
local l_0_6 = {
  "/var/tmp/",
  "/tmp/",
  "/dev/shm/",
  "/root/"
}
for l_0_7, l_0_8 in ipairs(l_0_6) do
  if l_0_2:sub(1, #l_0_8) == l_0_8 then
    return mp.INFECTED
  end
end
return mp.CLEAN
