-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaLinuxNewFileCreatedA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT)
if l_0_0 == false then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC25: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC26: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC27: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in (".rpm")(".iso") do
  if l_0_1:sub(-1 * #l_0_7) == l_0_7 then
    return mp.CLEAN
  end
end
local l_0_8 = {}
-- DECOMPILER ERROR at PC52: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC53: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

for l_0_12,l_0_13 in ("/usr/")("/var/lib/") do
  -- DECOMPILER ERROR at PC57: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC57: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R12 in 'AssignReg'

  if ("/opt/")("/etc/", "/snap/", "/proc/") == l_0_13 then
    return mp.CLEAN
  end
end
local l_0_14 = {}
-- DECOMPILER ERROR at PC77: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC92: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC93: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC94: Overwrote pending register: R6 in 'AssignReg'

for l_0_18,l_0_19 in ("/ansible")("/splunkd/") do
  -- DECOMPILER ERROR at PC97: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC99: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC100: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC101: Overwrote pending register: R13 in 'AssignReg'

  if (("/var/intel").find)("/var/cache", "/var/arcticwolfnetworks", "/sbin/", true) then
    return mp.CLEAN
  end
end
if (mp.get_mpattribute)("BM_ELF_FILE") then
  taint(l_0_1, "new_elf_file_created_hint", 7200)
end
;
(mp.set_mpattribute)("BM_NewFileCreated")
local l_0_20 = false
if l_0_1:sub(1, 5) == "/mnt/" then
  (mp.set_mpattribute)("BM_NewFileCreatedMountPath")
end
-- DECOMPILER ERROR at PC144: Overwrote pending register: R5 in 'AssignReg'

if l_0_1:sub(1, 6) == "/root/" then
  (mp.set_mpattribute)("BM_NewFileCreatedRootPath")
end
-- DECOMPILER ERROR at PC155: Overwrote pending register: R5 in 'AssignReg'

if l_0_1:sub(1, 9) == "/srv/ftp/" then
  (mp.set_mpattribute)("BM_NewFileCreatedFtpPath")
end
-- DECOMPILER ERROR at PC166: Overwrote pending register: R5 in 'AssignReg'

if l_0_1:sub(1, 9) == "/dev/shm/" then
  (mp.set_mpattribute)("BM_NewFileCreatedDevShmPath")
end
-- DECOMPILER ERROR at PC177: Overwrote pending register: R5 in 'AssignReg'

if l_0_1:sub(1, 11) == "/var/spool/" then
  (mp.set_mpattribute)("BM_NewFileCreatedVarSpoolPath")
end
local l_0_21 = {}
-- DECOMPILER ERROR at PC186: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC187: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC188: Overwrote pending register: R8 in 'AssignReg'

for l_0_25,l_0_26 in ("/var/tmp/")("/tmp/") do
  -- DECOMPILER ERROR at PC193: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC197: Overwrote pending register: R5 in 'AssignReg'

  if l_0_1:sub(1, ".kubectl") == l_0_26 then
    (mp.set_mpattribute)("BM_NewFileCreatedWWWPath")
  end
end
do
  do
    if l_0_20 == true then
      if (mp.get_mpattribute)("BM_PY_FILE") or (mp.get_mpattribute)("Lua:PYExt") or (mp.get_mpattribute)("Lua:PHPExt") or (mp.get_mpattribute)("BM_PHP_FILE") or (mp.get_mpattribute)("Lua:SHExt") or (mp.get_mpattribute)("BM_SH_FILE") or (mp.get_mpattribute)("Lua:SCPTExt") then
        (mp.set_mpattribute)("BM_NewScriptFileCreatedSpecialPath")
        taint(l_0_1, "new_script_file_created_hint", 7200)
      end
      if (mp.get_mpattribute)("BM_BZIP2_FILE") or (mp.get_mpattribute)("BM_ZIP_FILE") or (mp.get_mpattribute)("BM_7Z_FILE") or (mp.get_mpattribute)("BM_GZIP_FILE") or (mp.get_mpattribute)("BM_ZLIB_FILE") or (mp.get_mpattribute)("BM_TAR_FILE") or (mp.get_mpattribute)("BM_RAR_FILE") then
        taint(l_0_1, "new_archive_file_created_hint", 7200)
      end
    end
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

