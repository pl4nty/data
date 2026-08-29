-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\158eb319786d3a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1, l_1_2 = pcall(MpCommon.AtomicCounterValue, l_1_0)
  do
    do return not l_1_1 or l_1_2 ~= nil end
    -- DECOMPILER ERROR at PC12: freeLocal<0 in 'ReleaseLocals'

    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil and (l_0_0("linux_pkg_maintenance_active") or l_0_0("linux_config_mgmt_active")) then
  return mp.CLEAN
end
if l_0_1.ppid ~= nil and isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
local l_0_2 = function(l_2_0, l_2_1)
  -- function num : 0_1
  do
    if l_2_0 ~= nil then
      local l_2_2 = (string.find)(l_2_0, l_2_1, 1, true)
    else
    end
    return false
  end
end

do
  local l_0_3 = (bm.get_imagepath)() or ""
  local l_0_4 = nil
  do
    local l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16, l_0_17, l_0_18, l_0_19, l_0_20, l_0_23, l_0_26, l_0_29, l_0_32, l_0_35, l_0_38, l_0_41, l_0_44, l_0_47, l_0_50, l_0_53, l_0_56, l_0_59, l_0_62, l_0_65, l_0_68, l_0_70, l_0_72, l_0_75, l_0_77, l_0_80, l_0_82, l_0_85, l_0_87, l_0_90, l_0_92, l_0_95, l_0_97, l_0_100, l_0_102, l_0_105, l_0_107, l_0_110, l_0_112, l_0_115, l_0_117, l_0_120, l_0_121, l_0_123, l_0_126, l_0_127, l_0_129, l_0_131, l_0_132, l_0_134, l_0_137 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
    -- DECOMPILER ERROR at PC71: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC75: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC82: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC89: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC96: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC96: Unhandled construct in 'MakeBoolean' P3

    if (l_0_4 ~= "" and (string.match)(l_0_4, "/k3s$")) or l_0_6 ~= "" and ((string.match)(l_0_6, "/k3s$") or (string.match)(l_0_6, "/containerd$") or (string.match)(l_0_6, "/containerd%-shim")) then
      return mp.CLEAN
    end
    do
      local l_0_21, l_0_24, l_0_27, l_0_30, l_0_33, l_0_36, l_0_39, l_0_42, l_0_45, l_0_48, l_0_51, l_0_54, l_0_57, l_0_60, l_0_63, l_0_66, l_0_69, l_0_71, l_0_73, l_0_76, l_0_78, l_0_81, l_0_83, l_0_86, l_0_88, l_0_91, l_0_93, l_0_96, l_0_98, l_0_101, l_0_103, l_0_106, l_0_108, l_0_111, l_0_113, l_0_116, l_0_118, l_0_122, l_0_124, l_0_128, l_0_130, l_0_133, l_0_135, l_0_138 = , l_0_1 ~= nil and l_0_1.command_line or ""
      -- DECOMPILER ERROR at PC103: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC107: Confused about usage of register: R4 in 'UnsetPending'

      do
        local l_0_22, l_0_25, l_0_28, l_0_31, l_0_34, l_0_37, l_0_40, l_0_43, l_0_46, l_0_49, l_0_52, l_0_55, l_0_58, l_0_61, l_0_64, l_0_67, l_0_74, l_0_79, l_0_84, l_0_89, l_0_94, l_0_99, l_0_104, l_0_109, l_0_114, l_0_119, l_0_125, l_0_136, l_0_139 = , l_0_21 ~= nil and (mp.GetProcessCommandLine)(l_0_21.ppid) or ""
        -- DECOMPILER ERROR at PC112: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_28 == "" and (l_0_2(l_0_4, "/python") or l_0_2(l_0_4, "/platform-python") or l_0_2(l_0_4, "/perl")) then
          if l_0_0("linux_pkg_maintenance_active") then
            return mp.CLEAN
          end
          if l_0_0("linux_config_mgmt_active") then
            return mp.CLEAN
          end
        end
        -- DECOMPILER ERROR at PC149: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC155: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC161: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC167: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC173: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC179: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC185: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC191: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC197: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC203: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC209: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC215: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_2(l_0_25, "/opt/sophos-av/engine/") or l_0_2(l_0_25, "/opt/sophos/engine/") or l_0_2(l_0_25, "/opt/deepinstinct/") or l_0_2(l_0_25, "/opt/kaspersky/kesl/") or l_0_2(l_0_25, "/opt/aquasec/") or l_0_2(l_0_25, "/var/lib/aquasec/") or l_0_2(l_0_25, "/opt/CA/AccessControl/") or l_0_2(l_0_25, "/opt/jc/lib/") or l_0_2(l_0_25, "/opt/VRTSralus/bin/beremote") or l_0_2(l_0_25, "/usr/local/manageengine/uems_agent/bin/dcconfig") or l_0_2(l_0_25, "/usr/local/manageengine/uems_agent/bin/dcpatchscan") or l_0_2(l_0_25, "/opt/puppetlabs/puppet/bin/ruby") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC224: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC230: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC236: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC242: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC248: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC254: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC260: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC266: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC272: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC278: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC284: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC290: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC296: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC302: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_2(l_0_31, "/aquasec/") or l_0_2(l_0_31, "/opt/CA/AccessControl/") or l_0_2(l_0_31, "/opt/jc/lib/") or l_0_2(l_0_31, "install_pam.sh -s") or l_0_2(l_0_31, "/etc/pingid/libtool") or l_0_2(l_0_31, "/opt/deepinstinct/") or l_0_2(l_0_31, "/usr/sbin/debootstrap") or l_0_2(l_0_31, "/lib/security/howdy/") or l_0_2(l_0_31, "/usr/lib/security/howdy/") or l_0_2(l_0_31, "howdy add") or l_0_2(l_0_31, "howdy config") or l_0_2(l_0_31, "/usr/bin/xClient 01010011011011100110111101110111") or l_0_2(l_0_31, "/var/cache/apt/archives/") or l_0_2(l_0_31, "libpam-modules-bin") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC311: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC317: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC323: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_2(l_0_31, "BECOME-SUCCESS") and (l_0_2(l_0_31, "/usr/bin/python3") or l_0_2(l_0_28, "/usr/bin/python3")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC332: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC338: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC344: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC350: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC356: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC362: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC368: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC374: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC380: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC386: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC392: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC398: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC404: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC410: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC416: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC422: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC428: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC434: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC440: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC446: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC458: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC464: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC470: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC482: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC488: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC494: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC506: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_2(l_0_28, "pam_duo.so") or l_0_2(l_0_31, "pam_duo.so") or l_0_2(l_0_28, "duo_unix-") or l_0_2(l_0_31, "duo_unix-") or l_0_2(l_0_28, "pam_authlite.so") or l_0_2(l_0_31, "pam_authlite.so") or l_0_2(l_0_28, "/opt/pmpagent/manageengine/uems_agent/") or l_0_2(l_0_31, "/opt/pmpagent/manageengine/uems_agent/") or l_0_2(l_0_28, "timeshift/snapshots/") or l_0_2(l_0_31, "timeshift/snapshots/") or l_0_2(l_0_28, "dlib_face_recognition_resnet_model") or l_0_2(l_0_31, "dlib_face_recognition_resnet_model") or l_0_2(l_0_28, "mmod_human_face_detector.dat") or l_0_2(l_0_31, "mmod_human_face_detector.dat") or l_0_2(l_0_28, "shape_predictor_5_face_landmarks.dat") or l_0_2(l_0_31, "shape_predictor_5_face_landmarks.dat") or l_0_2(l_0_28, "pam_systemd.so.restoreme") or l_0_2(l_0_31, "pam_systemd.so.restoreme") or l_0_2(l_0_28, "/usr/local/manageengine/uems_agent/bin/dcpatchscan") or l_0_2(l_0_31, "/usr/local/manageengine/uems_agent/bin/dcpatchscan") or l_0_2(l_0_4, "/dracut-install") or l_0_2(l_0_25, "/dracut-install") or l_0_2(l_0_28, "/usr/lib/dracut/dracut-install") or l_0_2(l_0_31, "/usr/lib/dracut/dracut-install") or l_0_2(l_0_4, "/e4defrag") or l_0_2(l_0_25, "/e4defrag") or l_0_2(l_0_28, "systemd-detect-virt") or l_0_2(l_0_28, "locale charmap") or l_0_2(l_0_4, "/cmake") or l_0_2(l_0_25, "/cmake") then
          return mp.CLEAN
        end
        if (function()
  -- function num : 0_2 , upvalues : l_0_2, l_0_r6, l_0_r7
  local l_3_1, l_3_2 = pcall(bm.get_process_relationships)
  if not l_3_1 then
    return false
  end
  local l_3_4 = nil
  if not l_3_4 then
    for i_1,i_2 in ipairs({}) do
      local l_3_6 = function(l_4_0)
    -- function num : 0_2_0 , upvalues : l_0_2, l_0_r6, l_0_r7
    if l_4_0 == nil then
      return false
    end
    do
      local l_4_1, l_4_3, l_4_5, l_4_7, l_4_9, l_4_11, l_4_13, l_4_15, l_4_17, l_4_18 = l_4_0.image_path or ""
      do
        local l_4_2, l_4_4, l_4_6, l_4_8, l_4_10, l_4_12, l_4_14, l_4_16, l_4_19 = , l_4_0.cmd_line or ""
        -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_2(l_4_4, "/opt/jc/lib/") then
          return true
        end
        -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

        if (l_0_2(l_4_4, "authselect create-profile authlite") or l_0_2(l_4_4, "authselect select authlite")) and (l_0_2(l_0_r6, "/usr/bin/cmake -P") or l_0_2(l_0_r7, "make install") or l_0_2(l_4_4, "make install")) then
          return true
        end
        -- DECOMPILER ERROR at PC53: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_2(l_4_4, "ansible.module_utils._embed.dnf") then
          return true
        end
        -- DECOMPILER ERROR at PC61: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC67: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_2(l_4_4, "/usr/bin/dpkg-maintscript-helper") and l_0_2(l_4_4, " upgrade ") then
          return true
        end
        -- DECOMPILER ERROR at PC75: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC87: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_2(l_4_4, "PackageKit.StateHasChanged cache-update") and (l_0_2(l_4_2, "/gdbus") or l_0_2(l_4_4, "/usr/bin/gdbus")) then
          return true
        end
        return false
      end
    end
  end

      if l_3_6(i_2) then
        return true
      end
    end
    local l_3_9 = nil
    if not l_3_2 then
      do
        for i_1,i_2 in ipairs({}) do
          if l_3_9(i_2) then
            return true
          end
        end
        do return false end
        -- DECOMPILER ERROR at PC44: freeLocal<0 in 'ReleaseLocals'

      end
    end
  end
end
)() then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC526: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC532: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC538: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC544: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC550: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC556: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_2(l_0_28, "/usr/bin/cmake -P") or l_0_2(l_0_31, "make install")) and (l_0_2(l_0_31, "authselect create-profile authlite") or l_0_2(l_0_31, "authselect select authlite") or l_0_2(l_0_28, "authselect create-profile authlite") or l_0_2(l_0_28, "authselect select authlite")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC565: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC571: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_2(l_0_28, "/bin/sh /usr/sbin/ldconfig") and l_0_2(l_0_31, "/var/lib/dpkg/info/libc-bin.postinst triggered ldconfig") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC580: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC586: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_2(l_0_28, "sh -i -c yum update-minimal --security -y") and l_0_2(l_0_31, "sudo -S -- sh -i -c yum update-minimal --security -y") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC595: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC601: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC607: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_2(l_0_28, "bash -c tdnf install -y util-linux") and (l_0_2(l_0_31, "/usr/bin/containerd-shim-runc-v2") or l_0_2(l_0_25, "/usr/bin/containerd-shim-runc-v2")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC616: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC622: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_2(l_0_28, "/usr/bin/dnf --quiet -y upgrade") and l_0_2(l_0_31, "/usr/bin/salt-minion") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC631: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC637: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC643: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC649: Confused about usage of register: R7 in 'UnsetPending'

        if (l_0_2(l_0_28, "/etc/cron.daily/snow") and l_0_2(l_0_28, "xClient 01010011011011100110111101110111")) or l_0_2(l_0_31, "/etc/cron.daily/snow") and l_0_2(l_0_31, "xClient 01010011011011100110111101110111") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC664: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC670: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC676: Confused about usage of register: R7 in 'UnsetPending'

        if (l_0_2(l_0_4, "/usr/bin/python3") and l_0_2(l_0_28, "/usr/bin/yum") and l_0_2(l_0_28, "/usr/local/manageengine/uems_agent/")) or l_0_2(l_0_31, "/usr/local/manageengine/uems_agent/bin/dcconfig") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC685: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC691: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_2(l_0_31, "puppet agent: applying configuration") and l_0_2(l_0_28, "yum ") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC700: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC706: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC712: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC718: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_2(l_0_28, "harden-cis-safe.sh") and l_0_2(l_0_28, "pam_faillock.so")) or l_0_2(l_0_31, "harden-cis-safe.sh") and l_0_2(l_0_28, "pam_faillock.so") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC733: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC739: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC745: Confused about usage of register: R7 in 'UnsetPending'

        if (l_0_2(l_0_4, "/opt/MXB/bin/BackupFP") and l_0_2(l_0_28, "/opt/MXB/bin/BackupFP")) or l_0_2(l_0_25, "/opt/MXB/bin/BackupFP") and l_0_2(l_0_31, "/opt/MXB/bin/BackupFP") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC760: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC766: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC772: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC778: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC784: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC790: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC796: Confused about usage of register: R7 in 'UnsetPending'

        if (not l_0_2(l_0_4, "keytool") or (((l_0_2(l_0_28, "-importcert") or l_0_2(l_0_28, "-import ")) and l_0_2(l_0_28, "-keystore /lib/security/cacerts")) or not l_0_2(l_0_25, "keytool") or (not l_0_2(l_0_31, "-importcert") and not l_0_2(l_0_31, "-import ")) or l_0_2(l_0_31, "-keystore /lib/security/cacerts"))) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC817: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC823: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC829: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC835: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC841: Confused about usage of register: R6 in 'UnsetPending'

        if ((not l_0_2(l_0_4, "/usr/sbin/recover") and not l_0_2(l_0_4, "/usr/bin/recover")) or (not l_0_2(l_0_28, "/usr/sbin/recover -s ") and not l_0_2(l_0_28, "/usr/bin/recover -s ")) or not l_0_2(l_0_28, " -a ") or not l_0_2(l_0_28, " -I -") or l_0_2(l_0_28, " -x ")) then
          return mp.CLEAN
        end
        local l_0_141, l_0_142, l_0_143 = nil
        if pcall(bm.get_process_relationships) then
          if bm.get_process_relationships ~= nil then
            for l_0_147,l_0_148 in ipairs(R13_PC859) do
              local l_0_144, l_0_145, l_0_146, l_0_147, l_0_148 = nil
              -- DECOMPILER ERROR at PC861: Confused about usage of register: R16 in 'UnsetPending'

              -- DECOMPILER ERROR at PC866: Confused about usage of register: R16 in 'UnsetPending'

              if l_0_58.image_path ~= nil then
                (bm.add_related_process)(l_0_58.ppid)
              end
            end
          end
          do
            do
              -- DECOMPILER ERROR at PC870: Confused about usage of register: R11 in 'UnsetPending'

              -- DECOMPILER ERROR at PC873: Confused about usage of register: R11 in 'UnsetPending'

              if l_0_148 ~= nil then
                for l_0_152,l_0_153 in ipairs(l_0_148) do
                  local l_0_149, l_0_150, l_0_151, l_0_152, l_0_153 = nil
                  -- DECOMPILER ERROR at PC876: Confused about usage of register: R16 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC881: Confused about usage of register: R16 in 'UnsetPending'

                  if l_0_58.image_path ~= nil then
                    (bm.add_related_process)(l_0_58.ppid)
                    -- DECOMPILER ERROR at PC885: Confused about usage of register: R16 in 'UnsetPending'

                    if (string.find)(l_0_58.image_path, "/rpmkeys", 1, true) then
                      return mp.CLEAN
                    end
                    -- DECOMPILER ERROR at PC897: Confused about usage of register: R16 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC906: Confused about usage of register: R16 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC915: Confused about usage of register: R16 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC924: Confused about usage of register: R16 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC933: Confused about usage of register: R16 in 'UnsetPending'

                    if (string.find)(l_0_58.image_path, "/dpkg-deb", 1, true) or (string.find)(l_0_58.image_path, "/dpkg-split", 1, true) or (string.find)(l_0_58.image_path, "/bin/dpkg", 1, true) or (string.find)(l_0_58.image_path, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_58.image_path, "/bin/dpkg-split", 1, true) then
                      return mp.CLEAN
                    end
                    -- DECOMPILER ERROR at PC943: Confused about usage of register: R16 in 'UnsetPending'

                    do
                      do
                        local l_0_159 = l_0_58.cmd_line or ""
                        -- DECOMPILER ERROR at PC949: Confused about usage of register: R17 in 'UnsetPending'

                        if (string.find)(l_0_159, "/var/tmp/rpm-tmp.", 1, true) then
                          return mp.CLEAN
                        end
                        -- DECOMPILER ERROR at PC961: Confused about usage of register: R17 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC970: Confused about usage of register: R17 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC979: Confused about usage of register: R17 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC988: Confused about usage of register: R17 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC997: Confused about usage of register: R17 in 'UnsetPending'

                        if (string.find)(l_0_159, "/usr/bin/dpkg-deb", 1, true) or (string.find)(l_0_159, "/usr/bin/dpkg-split", 1, true) or (string.find)(l_0_159, "/bin/dpkg ", 1, true) or (string.find)(l_0_159, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_159, "/bin/dpkg-split", 1, true) then
                          return mp.CLEAN
                        end
                        -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
              end
              reportRelatedBmHits()
              do return mp.INFECTED end
              -- DECOMPILER ERROR at PC1014: freeLocal<0 in 'ReleaseLocals'

            end
          end
        end
      end
    end
  end
end

