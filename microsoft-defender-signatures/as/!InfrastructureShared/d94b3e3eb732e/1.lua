-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d94b3e3eb732e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = function(l_1_0, l_1_1)
  -- function num : 0_0
  do
    if l_1_0 ~= nil then
      local l_1_2 = (string.find)(l_1_0, l_1_1, 1, true)
    else
    end
    return false
  end
end

do
  local l_0_2 = (bm.get_imagepath)() or ""
  local l_0_3 = nil
  do
    local l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16, l_0_17, l_0_18, l_0_21, l_0_24, l_0_27, l_0_30, l_0_33, l_0_36, l_0_39, l_0_42, l_0_45, l_0_48, l_0_51, l_0_54, l_0_57, l_0_59, l_0_62, l_0_65, l_0_68, l_0_70, l_0_72, l_0_74, l_0_77, l_0_79, l_0_82, l_0_84, l_0_87, l_0_88, l_0_90, l_0_93, l_0_95, l_0_97, l_0_100, l_0_103, l_0_105, l_0_107, l_0_110, l_0_113, l_0_115, l_0_117, l_0_119, l_0_122, l_0_124, l_0_126, l_0_127, l_0_130, l_0_132, l_0_134, l_0_135, l_0_138, l_0_141 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
    -- DECOMPILER ERROR at PC56: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC60: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC67: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC74: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC81: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC81: Unhandled construct in 'MakeBoolean' P3

    if (l_0_3 ~= "" and (string.match)(l_0_3, "/k3s$")) or l_0_5 ~= "" and ((string.match)(l_0_5, "/k3s$") or (string.match)(l_0_5, "/containerd$") or (string.match)(l_0_5, "/containerd%-shim")) then
      return mp.CLEAN
    end
    do
      local l_0_19, l_0_22, l_0_25, l_0_28, l_0_31, l_0_34, l_0_37, l_0_40, l_0_43, l_0_46, l_0_49, l_0_52, l_0_55, l_0_58, l_0_60, l_0_63, l_0_66, l_0_69, l_0_71, l_0_73, l_0_75, l_0_78, l_0_80, l_0_83, l_0_85, l_0_89, l_0_91, l_0_94, l_0_96, l_0_98, l_0_101, l_0_104, l_0_106, l_0_108, l_0_111, l_0_114, l_0_116, l_0_118, l_0_120, l_0_123, l_0_125, l_0_128, l_0_131, l_0_133, l_0_136, l_0_139, l_0_142 = , l_0_0 ~= nil and l_0_0.command_line or ""
      -- DECOMPILER ERROR at PC88: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC92: Confused about usage of register: R3 in 'UnsetPending'

      do
        local l_0_20, l_0_23, l_0_26, l_0_29, l_0_32, l_0_35, l_0_38, l_0_41, l_0_44, l_0_47, l_0_50, l_0_53, l_0_56, l_0_61, l_0_64, l_0_67, l_0_76, l_0_81, l_0_86, l_0_92, l_0_99, l_0_102, l_0_109, l_0_112, l_0_121, l_0_129, l_0_137, l_0_140, l_0_143 = , l_0_19 ~= nil and (mp.GetProcessCommandLine)(l_0_19.ppid) or ""
        -- DECOMPILER ERROR at PC98: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC104: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC110: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC116: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC122: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC128: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC134: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC140: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC146: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC152: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC158: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_1(l_0_23, "/opt/sophos-av/engine/") or l_0_1(l_0_23, "/opt/sophos/engine/") or l_0_1(l_0_23, "/opt/deepinstinct/") or l_0_1(l_0_23, "/opt/kaspersky/kesl/") or l_0_1(l_0_23, "/opt/aquasec/") or l_0_1(l_0_23, "/var/lib/aquasec/") or l_0_1(l_0_23, "/opt/CA/AccessControl/") or l_0_1(l_0_23, "/opt/jc/lib/") or l_0_1(l_0_23, "/opt/VRTSralus/bin/beremote") or l_0_1(l_0_23, "/usr/local/manageengine/uems_agent/bin/dcconfig") or l_0_1(l_0_23, "/opt/puppetlabs/puppet/bin/ruby") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC167: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC173: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC179: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC185: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC191: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC197: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC203: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC209: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC215: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC221: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC227: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC233: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC239: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_29, "/aquasec/") or l_0_1(l_0_29, "/opt/CA/AccessControl/") or l_0_1(l_0_29, "/opt/jc/lib/") or l_0_1(l_0_29, "install_pam.sh -s") or l_0_1(l_0_29, "/etc/pingid/libtool") or l_0_1(l_0_29, "/opt/deepinstinct/") or l_0_1(l_0_29, "/usr/sbin/debootstrap") or l_0_1(l_0_29, "/lib/security/howdy/") or l_0_1(l_0_29, "/usr/lib/security/howdy/") or l_0_1(l_0_29, "howdy add") or l_0_1(l_0_29, "/usr/bin/xClient 01010011011011100110111101110111") or l_0_1(l_0_29, "/var/cache/apt/archives/") or l_0_1(l_0_29, "libpam-modules-bin") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC248: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC254: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC260: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC266: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC272: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC278: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_26, "/usr/bin/cmake -P") or l_0_1(l_0_29, "make install")) and (l_0_1(l_0_29, "authselect create-profile authlite") or l_0_1(l_0_29, "authselect select authlite") or l_0_1(l_0_26, "authselect create-profile authlite") or l_0_1(l_0_26, "authselect select authlite")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC287: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC293: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_26, "/bin/sh /usr/sbin/ldconfig") and l_0_1(l_0_29, "/var/lib/dpkg/info/libc-bin.postinst triggered ldconfig") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC302: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC308: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_26, "sh -i -c yum update-minimal --security -y") and l_0_1(l_0_29, "sudo -S -- sh -i -c yum update-minimal --security -y") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC317: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC323: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC329: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_1(l_0_26, "bash -c tdnf install -y util-linux") and (l_0_1(l_0_29, "/usr/bin/containerd-shim-runc-v2") or l_0_1(l_0_23, "/usr/bin/containerd-shim-runc-v2")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC338: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC344: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_26, "/usr/bin/dnf --quiet -y upgrade") and l_0_1(l_0_29, "/usr/bin/salt-minion") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC353: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC359: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC365: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC371: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_26, "/etc/cron.daily/snow") and l_0_1(l_0_26, "xClient 01010011011011100110111101110111")) or l_0_1(l_0_29, "/etc/cron.daily/snow") and l_0_1(l_0_29, "xClient 01010011011011100110111101110111") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC386: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC392: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC398: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_3, "/usr/bin/python3") and l_0_1(l_0_26, "/usr/bin/yum") and l_0_1(l_0_26, "/usr/local/manageengine/uems_agent/")) or l_0_1(l_0_29, "/usr/local/manageengine/uems_agent/bin/dcconfig") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC407: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC413: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_1(l_0_29, "puppet agent: applying configuration") and l_0_1(l_0_26, "yum ") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC422: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC428: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC434: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC440: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_26, "harden-cis-safe.sh") and l_0_1(l_0_26, "pam_faillock.so")) or l_0_1(l_0_29, "harden-cis-safe.sh") and l_0_1(l_0_26, "pam_faillock.so") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC455: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC461: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC467: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_3, "/opt/MXB/bin/BackupFP") and l_0_1(l_0_26, "/opt/MXB/bin/BackupFP")) or l_0_1(l_0_23, "/opt/MXB/bin/BackupFP") and l_0_1(l_0_29, "/opt/MXB/bin/BackupFP") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC482: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC488: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC494: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC500: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC506: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_3, "keytool") and l_0_1(l_0_26, "-importcert") and l_0_1(l_0_26, "-keystore /lib/security/cacerts")) or l_0_1(l_0_23, "keytool") and l_0_1(l_0_29, "-importcert") and l_0_1(l_0_29, "-keystore /lib/security/cacerts") then
          return mp.CLEAN
        end
        local l_0_144, l_0_145, l_0_146 = nil
        if pcall(bm.get_process_relationships) then
          if bm.get_process_relationships ~= nil then
            for l_0_150,l_0_151 in ipairs(R11_PC524) do
              local l_0_147, l_0_148, l_0_149, l_0_150 = nil
              -- DECOMPILER ERROR at PC526: Confused about usage of register: R14 in 'UnsetPending'

              -- DECOMPILER ERROR at PC531: Confused about usage of register: R14 in 'UnsetPending'

              if l_0_53.image_path ~= nil then
                (bm.add_related_process)(l_0_53.ppid)
              end
            end
          end
          do
            -- DECOMPILER ERROR at PC535: Confused about usage of register: R9 in 'UnsetPending'

            -- DECOMPILER ERROR at PC538: Confused about usage of register: R9 in 'UnsetPending'

            if l_0_150 ~= nil then
              for l_0_155,l_0_156 in ipairs(l_0_150) do
                local l_0_152, l_0_153, l_0_154, l_0_155 = nil
                -- DECOMPILER ERROR at PC541: Confused about usage of register: R14 in 'UnsetPending'

                -- DECOMPILER ERROR at PC546: Confused about usage of register: R14 in 'UnsetPending'

                if l_0_53.image_path ~= nil then
                  (bm.add_related_process)(l_0_53.ppid)
                  -- DECOMPILER ERROR at PC550: Confused about usage of register: R14 in 'UnsetPending'

                  if (string.find)(l_0_53.image_path, "/rpmkeys", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC562: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC571: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC580: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC589: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC598: Confused about usage of register: R14 in 'UnsetPending'

                  if (string.find)(l_0_53.image_path, "/dpkg-deb", 1, true) or (string.find)(l_0_53.image_path, "/dpkg-split", 1, true) or (string.find)(l_0_53.image_path, "/bin/dpkg", 1, true) or (string.find)(l_0_53.image_path, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_53.image_path, "/bin/dpkg-split", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC608: Confused about usage of register: R14 in 'UnsetPending'

                  do
                    do
                      local l_0_161, l_0_162 = l_0_53.cmd_line or ""
                      -- DECOMPILER ERROR at PC614: Confused about usage of register: R15 in 'UnsetPending'

                      if (string.find)(l_0_161, "/var/tmp/rpm-tmp.", 1, true) then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC626: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC635: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC644: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC653: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC662: Confused about usage of register: R15 in 'UnsetPending'

                      if (string.find)(l_0_161, "/usr/bin/dpkg-deb", 1, true) or (string.find)(l_0_161, "/usr/bin/dpkg-split", 1, true) or (string.find)(l_0_161, "/bin/dpkg ", 1, true) or (string.find)(l_0_161, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_161, "/bin/dpkg-split", 1, true) then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC672: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC672: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC672: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
            reportRelatedBmHits()
            return mp.INFECTED
          end
        end
      end
    end
  end
end

