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
    local l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16, l_0_17, l_0_18, l_0_21, l_0_24, l_0_27, l_0_30, l_0_33, l_0_36, l_0_39, l_0_42, l_0_45, l_0_48, l_0_51, l_0_54, l_0_57, l_0_59, l_0_62 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
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
      local l_0_19, l_0_22, l_0_25, l_0_28, l_0_31, l_0_34, l_0_37, l_0_40, l_0_43, l_0_46, l_0_49, l_0_52, l_0_55, l_0_58, l_0_60, l_0_63 = , l_0_0 ~= nil and l_0_0.command_line or ""
      -- DECOMPILER ERROR at PC88: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC92: Confused about usage of register: R3 in 'UnsetPending'

      do
        local l_0_20, l_0_23, l_0_26, l_0_29, l_0_32, l_0_35, l_0_38, l_0_41, l_0_44, l_0_47, l_0_50, l_0_53, l_0_56, l_0_61, l_0_64 = , l_0_19 ~= nil and (mp.GetProcessCommandLine)(l_0_19.ppid) or ""
        -- DECOMPILER ERROR at PC97: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_26 == "" and (l_0_1(l_0_3, "/python") or l_0_1(l_0_3, "/platform-python")) and pcall(MpCommon.AtomicCounterValue, "linux_pkg_maintenance_active") and MpCommon.AtomicCounterValue ~= nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC124: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC130: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC136: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC142: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC148: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC154: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC160: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC166: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC172: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC178: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC184: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_1(l_0_23, "/opt/sophos-av/engine/") or l_0_1(l_0_23, "/opt/sophos/engine/") or l_0_1(l_0_23, "/opt/deepinstinct/") or l_0_1(l_0_23, "/opt/kaspersky/kesl/") or l_0_1(l_0_23, "/opt/aquasec/") or l_0_1(l_0_23, "/var/lib/aquasec/") or l_0_1(l_0_23, "/opt/CA/AccessControl/") or l_0_1(l_0_23, "/opt/jc/lib/") or l_0_1(l_0_23, "/opt/VRTSralus/bin/beremote") or l_0_1(l_0_23, "/usr/local/manageengine/uems_agent/bin/dcconfig") or l_0_1(l_0_23, "/opt/puppetlabs/puppet/bin/ruby") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC193: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC199: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC205: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC211: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC217: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC223: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC229: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC235: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC241: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC247: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC253: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC259: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC265: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_29, "/aquasec/") or l_0_1(l_0_29, "/opt/CA/AccessControl/") or l_0_1(l_0_29, "/opt/jc/lib/") or l_0_1(l_0_29, "install_pam.sh -s") or l_0_1(l_0_29, "/etc/pingid/libtool") or l_0_1(l_0_29, "/opt/deepinstinct/") or l_0_1(l_0_29, "/usr/sbin/debootstrap") or l_0_1(l_0_29, "/lib/security/howdy/") or l_0_1(l_0_29, "/usr/lib/security/howdy/") or l_0_1(l_0_29, "howdy add") or l_0_1(l_0_29, "/usr/bin/xClient 01010011011011100110111101110111") or l_0_1(l_0_29, "/var/cache/apt/archives/") or l_0_1(l_0_29, "libpam-modules-bin") then
          return mp.CLEAN
        end
        if (function()
  -- function num : 0_1 , upvalues : l_0_1, l_0_r5, l_0_r6
  local l_2_1, l_2_2 = pcall(bm.get_process_relationships)
  if not l_2_1 then
    return false
  end
  local l_2_4 = nil
  if not l_2_4 then
    for i_1,i_2 in ipairs({}) do
      local l_2_6 = function(l_3_0)
    -- function num : 0_1_0 , upvalues : l_0_1, l_0_r5, l_0_r6
    if l_3_0 == nil then
      return false
    end
    do
      local l_3_1, l_3_3, l_3_5, l_3_7, l_3_9, l_3_11, l_3_13, l_3_15, l_3_17, l_3_18 = l_3_0.image_path or ""
      do
        local l_3_2, l_3_4, l_3_6, l_3_8, l_3_10, l_3_12, l_3_14, l_3_16, l_3_19 = , l_3_0.cmd_line or ""
        -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_1(l_3_4, "/opt/jc/lib/") then
          return true
        end
        -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

        if (l_0_1(l_3_4, "authselect create-profile authlite") or l_0_1(l_3_4, "authselect select authlite")) and (l_0_1(l_0_r5, "/usr/bin/cmake -P") or l_0_1(l_0_r6, "make install") or l_0_1(l_3_4, "make install")) then
          return true
        end
        -- DECOMPILER ERROR at PC53: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_1(l_3_4, "ansible.module_utils._embed.dnf") then
          return true
        end
        -- DECOMPILER ERROR at PC61: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC67: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_1(l_3_4, "/usr/bin/dpkg-maintscript-helper") and l_0_1(l_3_4, " upgrade ") then
          return true
        end
        -- DECOMPILER ERROR at PC75: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC87: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_1(l_3_4, "PackageKit.StateHasChanged cache-update") and (l_0_1(l_3_2, "/gdbus") or l_0_1(l_3_4, "/usr/bin/gdbus")) then
          return true
        end
        return false
      end
    end
  end

      if l_2_6(i_2) then
        return true
      end
    end
    local l_2_9 = nil
    if not l_2_2 then
      do
        for i_1,i_2 in ipairs({}) do
          if l_2_9(i_2) then
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
        -- DECOMPILER ERROR at PC285: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC291: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC297: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC303: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC309: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC315: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_26, "/usr/bin/cmake -P") or l_0_1(l_0_29, "make install")) and (l_0_1(l_0_29, "authselect create-profile authlite") or l_0_1(l_0_29, "authselect select authlite") or l_0_1(l_0_26, "authselect create-profile authlite") or l_0_1(l_0_26, "authselect select authlite")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC324: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC330: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_26, "/bin/sh /usr/sbin/ldconfig") and l_0_1(l_0_29, "/var/lib/dpkg/info/libc-bin.postinst triggered ldconfig") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC339: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC345: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_26, "sh -i -c yum update-minimal --security -y") and l_0_1(l_0_29, "sudo -S -- sh -i -c yum update-minimal --security -y") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC354: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC360: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC366: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_1(l_0_26, "bash -c tdnf install -y util-linux") and (l_0_1(l_0_29, "/usr/bin/containerd-shim-runc-v2") or l_0_1(l_0_23, "/usr/bin/containerd-shim-runc-v2")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC375: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC381: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_26, "/usr/bin/dnf --quiet -y upgrade") and l_0_1(l_0_29, "/usr/bin/salt-minion") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC390: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC396: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC402: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC408: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_26, "/etc/cron.daily/snow") and l_0_1(l_0_26, "xClient 01010011011011100110111101110111")) or l_0_1(l_0_29, "/etc/cron.daily/snow") and l_0_1(l_0_29, "xClient 01010011011011100110111101110111") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC423: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC429: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC435: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_3, "/usr/bin/python3") and l_0_1(l_0_26, "/usr/bin/yum") and l_0_1(l_0_26, "/usr/local/manageengine/uems_agent/")) or l_0_1(l_0_29, "/usr/local/manageengine/uems_agent/bin/dcconfig") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC444: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC450: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_1(l_0_29, "puppet agent: applying configuration") and l_0_1(l_0_26, "yum ") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC459: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC465: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC471: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC477: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_26, "harden-cis-safe.sh") and l_0_1(l_0_26, "pam_faillock.so")) or l_0_1(l_0_29, "harden-cis-safe.sh") and l_0_1(l_0_26, "pam_faillock.so") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC492: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC498: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC504: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_3, "/opt/MXB/bin/BackupFP") and l_0_1(l_0_26, "/opt/MXB/bin/BackupFP")) or l_0_1(l_0_23, "/opt/MXB/bin/BackupFP") and l_0_1(l_0_29, "/opt/MXB/bin/BackupFP") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC519: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC525: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC531: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC537: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC543: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC549: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC555: Confused about usage of register: R6 in 'UnsetPending'

        if (not l_0_1(l_0_3, "keytool") or (((l_0_1(l_0_26, "-importcert") or l_0_1(l_0_26, "-import ")) and l_0_1(l_0_26, "-keystore /lib/security/cacerts")) or not l_0_1(l_0_23, "keytool") or (not l_0_1(l_0_29, "-importcert") and not l_0_1(l_0_29, "-import ")) or l_0_1(l_0_29, "-keystore /lib/security/cacerts"))) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC576: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC582: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC588: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC594: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC600: Confused about usage of register: R5 in 'UnsetPending'

        if ((not l_0_1(l_0_3, "/usr/sbin/recover") and not l_0_1(l_0_3, "/usr/bin/recover")) or (not l_0_1(l_0_26, "/usr/sbin/recover -s ") and not l_0_1(l_0_26, "/usr/bin/recover -s ")) or not l_0_1(l_0_26, " -a ") or not l_0_1(l_0_26, " -I -") or l_0_1(l_0_26, " -x ")) then
          return mp.CLEAN
        end
        local l_0_66, l_0_67, l_0_68 = nil
        if pcall(bm.get_process_relationships) then
          if bm.get_process_relationships ~= nil then
            for l_0_72,l_0_73 in ipairs(R12_PC618) do
              local l_0_69, l_0_70, l_0_71, l_0_72, l_0_73 = nil
              -- DECOMPILER ERROR at PC620: Confused about usage of register: R15 in 'UnsetPending'

              -- DECOMPILER ERROR at PC625: Confused about usage of register: R15 in 'UnsetPending'

              if l_0_56.image_path ~= nil then
                (bm.add_related_process)(l_0_56.ppid)
              end
            end
          end
          do
            do
              -- DECOMPILER ERROR at PC629: Confused about usage of register: R10 in 'UnsetPending'

              -- DECOMPILER ERROR at PC632: Confused about usage of register: R10 in 'UnsetPending'

              if l_0_73 ~= nil then
                for l_0_77,l_0_78 in ipairs(l_0_73) do
                  local l_0_74, l_0_75, l_0_76, l_0_77, l_0_78 = nil
                  -- DECOMPILER ERROR at PC635: Confused about usage of register: R15 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC640: Confused about usage of register: R15 in 'UnsetPending'

                  if l_0_56.image_path ~= nil then
                    (bm.add_related_process)(l_0_56.ppid)
                    -- DECOMPILER ERROR at PC644: Confused about usage of register: R15 in 'UnsetPending'

                    if (string.find)(l_0_56.image_path, "/rpmkeys", 1, true) then
                      return mp.CLEAN
                    end
                    -- DECOMPILER ERROR at PC656: Confused about usage of register: R15 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC665: Confused about usage of register: R15 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC674: Confused about usage of register: R15 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC683: Confused about usage of register: R15 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC692: Confused about usage of register: R15 in 'UnsetPending'

                    if (string.find)(l_0_56.image_path, "/dpkg-deb", 1, true) or (string.find)(l_0_56.image_path, "/dpkg-split", 1, true) or (string.find)(l_0_56.image_path, "/bin/dpkg", 1, true) or (string.find)(l_0_56.image_path, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_56.image_path, "/bin/dpkg-split", 1, true) then
                      return mp.CLEAN
                    end
                    -- DECOMPILER ERROR at PC702: Confused about usage of register: R15 in 'UnsetPending'

                    do
                      do
                        local l_0_84 = l_0_56.cmd_line or ""
                        -- DECOMPILER ERROR at PC708: Confused about usage of register: R16 in 'UnsetPending'

                        if (string.find)(l_0_84, "/var/tmp/rpm-tmp.", 1, true) then
                          return mp.CLEAN
                        end
                        -- DECOMPILER ERROR at PC720: Confused about usage of register: R16 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC729: Confused about usage of register: R16 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC738: Confused about usage of register: R16 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC747: Confused about usage of register: R16 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC756: Confused about usage of register: R16 in 'UnsetPending'

                        if (string.find)(l_0_84, "/usr/bin/dpkg-deb", 1, true) or (string.find)(l_0_84, "/usr/bin/dpkg-split", 1, true) or (string.find)(l_0_84, "/bin/dpkg ", 1, true) or (string.find)(l_0_84, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_84, "/bin/dpkg-split", 1, true) then
                          return mp.CLEAN
                        end
                        -- DECOMPILER ERROR at PC766: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC766: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC766: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
              end
              reportRelatedBmHits()
              do return mp.INFECTED end
              -- DECOMPILER ERROR at PC773: freeLocal<0 in 'ReleaseLocals'

            end
          end
        end
      end
    end
  end
end

