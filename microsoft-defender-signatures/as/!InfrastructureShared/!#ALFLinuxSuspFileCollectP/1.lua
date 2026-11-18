-- Threat: !InfrastructureShared
-- Name: !#ALF:Linux/SuspFileCollect.P
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (BM_ELF_FILE | BM_PY_FILE | Lua:PYExt | Lua:PHPExt | BM_PHP_FILE | Lua:SHExt | BM_SH_FILE | Lua:SCPTExt | Lua:ISOExt | Possible_PythonCode | BM_BZIP2_FILE | BM_ZIP_FILE | BM_7Z_FILE | BM_GZIP_FILE | BM_ZLIB_FILE | BM_TAR_FILE | BM_RAR_FILE)

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "9d61afa0-cfa4-4746-95af-dc897a6f6774" and l_0_0:lower() ~= "73a99e52-c380-4b86-9d47-fe1cb231f222" then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or #l_0_2 < 4 then
  return mp.CLEAN
end
if mp.getfilesize() > 104857600 then
  return mp.CLEAN
end
local l_0_3 = {
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
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if l_0_2:sub(1, #l_0_5) == l_0_5 then
    return mp.CLEAN
  end
end
local l_0_6 = {
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
for l_0_7, l_0_8 in ipairs(l_0_6) do
  if string.find(l_0_2, l_0_8, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
