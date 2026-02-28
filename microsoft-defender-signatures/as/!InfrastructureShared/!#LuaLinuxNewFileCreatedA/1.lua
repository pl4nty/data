local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if L0_1 == false then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = ".rpm"
L4_1 = ".iso"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L9_1 = L1_1
  L8_1 = L1_1.sub
  L10_1 = #L7_1
  L10_1 = -1 * L10_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 == L7_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L3_1 = {}
L4_1 = "/usr/"
L5_1 = "/var/lib/"
L6_1 = "/bin/"
L7_1 = "/var/log/"
L8_1 = "/var/opt/"
L9_1 = "/opt/"
L10_1 = "/etc/"
L11_1 = "/snap/"
L12_1 = "/proc/"
L13_1 = "/sbin/"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L10_1 = L1_1
  L9_1 = L1_1.sub
  L11_1 = 1
  L12_1 = #L8_1
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  if L9_1 == L8_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
end
L4_1 = {}
L5_1 = "/ansible"
L6_1 = "/splunkd/"
L7_1 = "/oracle/"
L8_1 = "-salt-"
L9_1 = "/tmp/go-build"
L10_1 = "/var/intel"
L11_1 = "/var/cache"
L12_1 = "/var/arcticwolfnetworks"
L13_1 = "/jenkins"
L14_1 = "/filebeat"
L15_1 = ".kubectl"
L16_1 = "clamav-"
L17_1 = ".tivoli"
L18_1 = "containerd-shim"
L19_1 = "docker-"
L20_1 = "influx_"
L21_1 = "influxd"
L22_1 = "terraform-"
L23_1 = "zscaler-"
L24_1 = "/tmp/apt-key-gpg"
L25_1 = "common-setup-and-utils-script.sh"
L26_1 = "mdatp-edr-mitre-setup.sh"
L27_1 = "mdatp-epp-mitre-setup.sh"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L4_1[11] = L15_1
L4_1[12] = L16_1
L4_1[13] = L17_1
L4_1[14] = L18_1
L4_1[15] = L19_1
L4_1[16] = L20_1
L4_1[17] = L21_1
L4_1[18] = L22_1
L4_1[19] = L23_1
L4_1[20] = L24_1
L4_1[21] = L25_1
L4_1[22] = L26_1
L4_1[23] = L27_1
L5_1 = ipairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L1_1
  L12_1 = L9_1
  L13_1 = 1
  L14_1 = true
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
end
L5_1 = mp
L5_1 = L5_1.get_mpattribute
L6_1 = "BM_ELF_FILE"
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = taint
  L6_1 = L1_1
  L7_1 = "new_elf_file_created_hint"
  L8_1 = 7200
  L5_1(L6_1, L7_1, L8_1)
end
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "BM_NewFileCreated"
L5_1(L6_1)
L5_1 = false
L7_1 = L1_1
L6_1 = L1_1.sub
L8_1 = 1
L9_1 = 5
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 == "/mnt/" then
  L5_1 = true
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "BM_NewFileCreatedMountPath"
  L6_1(L7_1)
end
L7_1 = L1_1
L6_1 = L1_1.sub
L8_1 = 1
L9_1 = 6
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 == "/root/" then
  L5_1 = true
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "BM_NewFileCreatedRootPath"
  L6_1(L7_1)
end
L7_1 = L1_1
L6_1 = L1_1.sub
L8_1 = 1
L9_1 = 9
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 == "/srv/ftp/" then
  L5_1 = true
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "BM_NewFileCreatedFtpPath"
  L6_1(L7_1)
end
L7_1 = L1_1
L6_1 = L1_1.sub
L8_1 = 1
L9_1 = 9
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 == "/dev/shm/" then
  L5_1 = true
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "BM_NewFileCreatedDevShmPath"
  L6_1(L7_1)
end
L7_1 = L1_1
L6_1 = L1_1.sub
L8_1 = 1
L9_1 = 11
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 == "/var/spool/" then
  L5_1 = true
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "BM_NewFileCreatedVarSpoolPath"
  L6_1(L7_1)
end
L6_1 = {}
L7_1 = "/var/tmp/"
L8_1 = "/tmp/"
L9_1 = "/home/"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L7_1 = ipairs
L8_1 = L6_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L13_1 = L1_1
  L12_1 = L1_1.sub
  L14_1 = 1
  L15_1 = #L11_1
  L12_1 = L12_1(L13_1, L14_1, L15_1)
  if L12_1 == L11_1 then
    L5_1 = true
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "BM_NewFileCreatedWWWPath"
    L12_1(L13_1)
  end
end
if L5_1 == true then
  L7_1 = mp
  L7_1 = L7_1.get_mpattribute
  L8_1 = "BM_PY_FILE"
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    L7_1 = mp
    L7_1 = L7_1.get_mpattribute
    L8_1 = "Lua:PYExt"
    L7_1 = L7_1(L8_1)
    if not L7_1 then
      L7_1 = mp
      L7_1 = L7_1.get_mpattribute
      L8_1 = "Lua:PHPExt"
      L7_1 = L7_1(L8_1)
      if not L7_1 then
        L7_1 = mp
        L7_1 = L7_1.get_mpattribute
        L8_1 = "BM_PHP_FILE"
        L7_1 = L7_1(L8_1)
        if not L7_1 then
          L7_1 = mp
          L7_1 = L7_1.get_mpattribute
          L8_1 = "Lua:SHExt"
          L7_1 = L7_1(L8_1)
          if not L7_1 then
            L7_1 = mp
            L7_1 = L7_1.get_mpattribute
            L8_1 = "BM_SH_FILE"
            L7_1 = L7_1(L8_1)
            if not L7_1 then
              L7_1 = mp
              L7_1 = L7_1.get_mpattribute
              L8_1 = "Lua:SCPTExt"
              L7_1 = L7_1(L8_1)
              if not L7_1 then
                goto lbl_258
              end
            end
          end
        end
      end
    end
  end
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "BM_NewScriptFileCreatedSpecialPath"
  L7_1(L8_1)
  L7_1 = taint
  L8_1 = L1_1
  L9_1 = "new_script_file_created_hint"
  L10_1 = 7200
  L7_1(L8_1, L9_1, L10_1)
  ::lbl_258::
  L7_1 = mp
  L7_1 = L7_1.get_mpattribute
  L8_1 = "BM_BZIP2_FILE"
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    L7_1 = mp
    L7_1 = L7_1.get_mpattribute
    L8_1 = "BM_ZIP_FILE"
    L7_1 = L7_1(L8_1)
    if not L7_1 then
      L7_1 = mp
      L7_1 = L7_1.get_mpattribute
      L8_1 = "BM_7Z_FILE"
      L7_1 = L7_1(L8_1)
      if not L7_1 then
        L7_1 = mp
        L7_1 = L7_1.get_mpattribute
        L8_1 = "BM_GZIP_FILE"
        L7_1 = L7_1(L8_1)
        if not L7_1 then
          L7_1 = mp
          L7_1 = L7_1.get_mpattribute
          L8_1 = "BM_ZLIB_FILE"
          L7_1 = L7_1(L8_1)
          if not L7_1 then
            L7_1 = mp
            L7_1 = L7_1.get_mpattribute
            L8_1 = "BM_TAR_FILE"
            L7_1 = L7_1(L8_1)
            if not L7_1 then
              L7_1 = mp
              L7_1 = L7_1.get_mpattribute
              L8_1 = "BM_RAR_FILE"
              L7_1 = L7_1(L8_1)
              if not L7_1 then
                goto lbl_305
              end
            end
          end
        end
      end
    end
  end
  L7_1 = taint
  L8_1 = L1_1
  L9_1 = "new_archive_file_created_hint"
  L10_1 = 7200
  L7_1(L8_1, L9_1, L10_1)
end
::lbl_305::
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
