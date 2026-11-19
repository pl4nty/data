-- Threat: !InfrastructureShared
-- Name: !#Lua:Linux/NewFileCreated.A
-- Type: 12
-- Includes: BMLuaLib

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT)
if l_0_0 == false then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {".rpm", ".iso"}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if l_0_1:sub(-1 * #l_0_4) == l_0_4 then
    return mp.CLEAN
  end
end
local l_0_5 = {
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
for l_0_6, l_0_7 in ipairs(l_0_5) do
  if l_0_1:sub(1, #l_0_7) == l_0_7 then
    return mp.CLEAN
  end
end
local l_0_8 = {
  "/ansible",
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
  "mdatp-epp-mitre-setup.sh"
}
for l_0_9, l_0_10 in ipairs(l_0_8) do
  if string.find(l_0_1, l_0_10, 1, true) then
    return mp.CLEAN
  end
end
if mp.get_mpattribute("BM_ELF_FILE") then
  taint(l_0_1, "new_elf_file_created_hint", 7200)
end
mp.set_mpattribute("BM_NewFileCreated")
local l_0_11 = false
if l_0_1:sub(1, 5) == "/mnt/" then
  l_0_11 = true
  mp.set_mpattribute("BM_NewFileCreatedMountPath")
end
if l_0_1:sub(1, 6) == "/root/" then
  l_0_11 = true
  mp.set_mpattribute("BM_NewFileCreatedRootPath")
end
if l_0_1:sub(1, 9) == "/srv/ftp/" then
  l_0_11 = true
  mp.set_mpattribute("BM_NewFileCreatedFtpPath")
end
if l_0_1:sub(1, 9) == "/dev/shm/" then
  l_0_11 = true
  mp.set_mpattribute("BM_NewFileCreatedDevShmPath")
end
if l_0_1:sub(1, 11) == "/var/spool/" then
  l_0_11 = true
  mp.set_mpattribute("BM_NewFileCreatedVarSpoolPath")
end
local l_0_12 = {
  "/var/tmp/",
  "/tmp/",
  "/home/"
}
for l_0_13, l_0_14 in ipairs(l_0_12) do
  if l_0_1:sub(1, #l_0_14) == l_0_14 then
    l_0_11 = true
    mp.set_mpattribute("BM_NewFileCreatedWWWPath")
  end
end
if l_0_11 == true then
  if mp.get_mpattribute("BM_PY_FILE") or mp.get_mpattribute("Lua:PYExt") or mp.get_mpattribute("Lua:PHPExt") or mp.get_mpattribute("BM_PHP_FILE") or mp.get_mpattribute("Lua:SHExt") or mp.get_mpattribute("BM_SH_FILE") or mp.get_mpattribute("Lua:SCPTExt") then
    mp.set_mpattribute("BM_NewScriptFileCreatedSpecialPath")
    taint(l_0_1, "new_script_file_created_hint", 7200)
  end
  if mp.get_mpattribute("BM_BZIP2_FILE") or mp.get_mpattribute("BM_ZIP_FILE") or mp.get_mpattribute("BM_7Z_FILE") or mp.get_mpattribute("BM_GZIP_FILE") or mp.get_mpattribute("BM_ZLIB_FILE") or mp.get_mpattribute("BM_TAR_FILE") or mp.get_mpattribute("BM_RAR_FILE") then
    taint(l_0_1, "new_archive_file_created_hint", 7200)
  end
end
return mp.INFECTED
