-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b4cb3530b9d3a\1.luac 

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
    local l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16, l_0_17, l_0_19, l_0_22, l_0_25, l_0_28, l_0_31, l_0_34, l_0_37, l_0_40, l_0_43, l_0_46, l_0_49, l_0_52, l_0_53, l_0_54, l_0_55, l_0_56, l_0_58, l_0_60, l_0_62, l_0_64, l_0_66, l_0_68, l_0_70, l_0_72, l_0_74, l_0_75, l_0_77, l_0_79, l_0_81, l_0_84, l_0_87, l_0_89, l_0_91, l_0_92, l_0_94, l_0_97, l_0_98, l_0_100, l_0_103, l_0_105 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
    do
      local l_0_18, l_0_20, l_0_23, l_0_26, l_0_29, l_0_32, l_0_35, l_0_38, l_0_41, l_0_44, l_0_47, l_0_50, l_0_57, l_0_59, l_0_61, l_0_63, l_0_65, l_0_67, l_0_69, l_0_71, l_0_73, l_0_76, l_0_78, l_0_80, l_0_82, l_0_85, l_0_88, l_0_90, l_0_93, l_0_95, l_0_99, l_0_101, l_0_104, l_0_106 = , l_0_1 ~= nil and l_0_1.command_line or ""
      -- DECOMPILER ERROR at PC54: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC58: Confused about usage of register: R4 in 'UnsetPending'

      do
        local l_0_21, l_0_24, l_0_27, l_0_30, l_0_33, l_0_36, l_0_39, l_0_42, l_0_45, l_0_48, l_0_51, l_0_83, l_0_86, l_0_96, l_0_102, l_0_107 = , l_0_18 ~= nil and (mp.GetProcessCommandLine)(l_0_18.ppid) or ""
        -- DECOMPILER ERROR at PC63: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_27 == "" and (l_0_2(l_0_4, "/python") or l_0_2(l_0_4, "/platform-python") or l_0_2(l_0_4, "/perl") or l_0_2(l_0_4, "/tar")) then
          if l_0_0("linux_config_mgmt_active") then
            return mp.CLEAN
          end
          if l_0_0("linux_pkg_maintenance_active") then
            return mp.CLEAN
          end
        end
        -- DECOMPILER ERROR at PC106: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC112: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC118: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC124: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC130: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC136: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC142: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC148: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC154: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC160: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC166: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC172: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_2(l_0_24, "/opt/chef/embedded/bin/ruby") or l_0_2(l_0_24, "/opt/cinc/embedded/bin/ruby") or l_0_2(l_0_24, "/opt/sophos-av/engine/") or l_0_2(l_0_24, "/opt/sophos/engine/") or l_0_2(l_0_24, "/opt/deepinstinct/") or l_0_2(l_0_24, "/opt/VRTSralus/bin/beremote") or l_0_2(l_0_24, "/usr/bin/google_guest_agent") or l_0_2(l_0_24, "/usr/lib/google/guest_agent/") or l_0_2(l_0_24, "/opt/jc/bin/jumpcloud-agent") or l_0_2(l_0_24, "/opt/cyberark/epm/sbin/epmd") or l_0_2(l_0_24, "/opt/cyberark/epm/bin/epmcli") or l_0_2(l_0_24, "/opt/puppetlabs/puppet/bin/ruby") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC187: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_2(l_0_4, "/memfd:epmd") and l_0_2(l_0_27, "/opt/cyberark/epm/sbin/epmd --mode=SERVICE") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC196: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC202: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC208: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC214: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC220: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC226: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC232: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC238: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC244: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC250: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC256: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_2(l_0_30, "domainjoin-cli") or l_0_2(l_0_30, "/tmp/chef-script") or l_0_2(l_0_30, "/usr/bin/chef-client") or l_0_2(l_0_30, "/usr/bin/cinc-client") or l_0_2(l_0_30, "/opt/chef-workstation/bin/chef-cli") or l_0_2(l_0_30, "/etc/chef/client.rb") or l_0_2(l_0_30, "/etc/cinc/client.rb") or l_0_2(l_0_30, "/usr/lib/skylight/enable_smartcard") or l_0_2(l_0_30, "main_entrance.py --file snapshot.json") or l_0_2(l_0_30, "duo.fulluser.tar") or l_0_2(l_0_30, "config_ssh_pam_for_rt.sh") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC287: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC291: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC298: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC305: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC312: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC312: Unhandled construct in 'MakeBoolean' P3

        if (l_0_4 ~= "" and (string.match)(l_0_4, "/k3s$")) or l_0_24 ~= "" and ((string.match)(l_0_24, "/k3s$") or (string.match)(l_0_24, "/containerd$") or (string.match)(l_0_24, "/containerd%-shim")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC332: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_2(l_0_4, "/usr/bin/python") or l_0_2(l_0_4, "/python2") or l_0_2(l_0_4, "/python3")) and l_0_2(l_0_27, "/usr/sbin/sosreport") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC354: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC360: Confused about usage of register: R6 in 'UnsetPending'

        if ((string.match)(l_0_4, "/login$") ~= nil or l_0_2(l_0_4, "/bin/login")) and (l_0_2(l_0_27, "/bin/login --") or l_0_2(l_0_27, " login --")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC388: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC394: Confused about usage of register: R6 in 'UnsetPending'

        if ((string.match)(l_0_4, "/rsync$") ~= nil or l_0_2(l_0_4, "/usr/bin/rsync") or l_0_2(l_0_4, "/bin/rsync")) and l_0_2(l_0_27, "rsync -") and not l_0_2(l_0_27, "/etc/pam.d/sshd") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC415: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC421: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC427: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC433: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_2(l_0_4, "/bin/sh") or l_0_2(l_0_4, "/bin/bash")) and l_0_2(l_0_27, "install.sh") and l_0_2(l_0_27, "adbridge-") and l_0_2(l_0_27, ".rpm") and l_0_2(l_0_27, "purge") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC454: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC460: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_2(l_0_4, "/opt/puppetlabs/puppet/bin/ruby") or l_0_2(l_0_4, "/usr/bin/puppet") or l_0_2(l_0_24, "/usr/bin/puppet")) and l_0_2(l_0_27, "puppet agent ") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC469: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC475: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC481: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC487: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_2(l_0_27, "/usr/bin/puppet agent ") or l_0_2(l_0_27, "/bin/puppet agent ") or l_0_2(l_0_30, "/usr/bin/puppet agent ") or l_0_2(l_0_30, "/bin/puppet agent ") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC496: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC502: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_2(l_0_27, "/usr/local/cpanel/bin/taskrun") and l_0_2(l_0_27, "/var/cpanel/updatelogs/") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC517: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC523: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC529: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC541: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC547: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC553: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC559: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_2(l_0_4, "/opt/aquasec/") or l_0_2(l_0_24, "/opt/aquasec/") or l_0_2(l_0_27, "/opt/aquasec/") or l_0_2(l_0_30, "/opt/aquasec/") or l_0_2(l_0_4, "/var/lib/aquasec/") or l_0_2(l_0_24, "/var/lib/aquasec/") or l_0_2(l_0_27, "/var/lib/aquasec/") or l_0_2(l_0_30, "/var/lib/aquasec/")) and l_0_2(l_0_27, "config_pam_aquasec.sh") then
          return mp.CLEAN
        end
        if (function()
  -- function num : 0_2 , upvalues : l_0_2
  local l_3_1, l_3_2 = pcall(bm.get_process_relationships)
  if not l_3_1 then
    return false
  end
  local l_3_0 = nil
  local l_3_4 = function(l_4_0)
    -- function num : 0_2_0 , upvalues : l_0_2
    if l_4_0 == nil then
      return false
    end
    do
      local l_4_1, l_4_3, l_4_5, l_4_7, l_4_9, l_4_11, l_4_12, l_4_13, l_4_15 = l_4_0.image_path or ""
      do
        local l_4_2, l_4_4, l_4_6, l_4_8, l_4_10, l_4_14, l_4_16 = , l_4_0.cmd_line or ""
        -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

        if (l_0_2(l_4_4, "/opt/aquasec/config_pam_aquasec.sh") or l_0_2(l_4_4, "/var/lib/aquasec/config_pam_aquasec.sh") or l_0_2(l_4_4, "config_pam_aquasec.sh -r")) and (l_0_2(l_4_4, "/opt/aquasec/") or l_0_2(l_4_4, "/var/lib/aquasec/") or l_0_2(l_4_2, "/opt/aquasec/") or l_0_2(l_4_2, "/var/lib/aquasec/")) then
          return true
        end
        -- DECOMPILER ERROR at PC57: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC63: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_2(l_4_4, "/usr/bin/puppet agent ") and l_0_2(l_4_4, "/usr/local/puppet/puppet4_cluster_checkin") then
          return true
        end
        return false
      end
    end
  end

  if not l_3_2 then
    for i_1,i_2 in ipairs({}) do
      if l_3_4(i_2) then
        return true
      end
    end
    local l_3_9 = ipairs
    if not l_3_0 then
      l_3_9 = l_3_9({})
      for i_1,i_2 in l_3_9 do
        if l_3_4(i_2) then
          return true
        end
      end
      do return false end
      -- DECOMPILER ERROR at PC42: Confused about usage of register R4 for local variables in 'ReleaseLocals'

    end
  end
end
)() then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC589: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC595: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC601: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC607: Confused about usage of register: R7 in 'UnsetPending'

        if (l_0_2(l_0_4, "/bin/sh") or l_0_2(l_0_4, "/bin/bash") or l_0_2(l_0_24, "/bin/sh") or l_0_2(l_0_24, "/bin/bash")) and (l_0_2(l_0_27, "configure_install_identity.sh") or l_0_2(l_0_30, "configure_install_identity.sh")) then
          return mp.CLEAN
        end
        if (function()
  -- function num : 0_3 , upvalues : l_0_2, l_0_r6
  local l_4_0 = {}
  -- DECOMPILER ERROR at PC4: No list found for R0 , SetList fails

  -- DECOMPILER ERROR at PC5: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC6: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC7: Overwrote pending register: R3 in 'AssignReg'

  if ("/emr/instance-controller/lib/bootstrap-actions/")("/usr/bin/instance-controller", "aws157.instancecontroller.Main") or l_0_2(l_0_r6, l_4_0[2]) or l_0_2(l_0_r6, l_4_0[3]) then
    return true
  end
  local l_4_1, l_4_2 = pcall(bm.get_process_relationships)
  if not l_4_1 or l_4_2 == nil then
    return false
  end
  for l_4_6,l_4_7 in ipairs(l_4_2) do
    do
      local l_4_8 = l_4_7.image_path or ""
      do
        local l_4_9 = nil
        for l_4_13,l_4_14 in ipairs(l_4_0) do
          local l_4_10, l_4_11 = , l_4_7.cmd_line or ""
          -- DECOMPILER ERROR at PC53: Confused about usage of register: R14 in 'UnsetPending'

          if l_0_2(l_4_10, R14_PC53) or l_0_2(l_4_11, R14_PC53) then
            return true
          end
        end
        do
          -- DECOMPILER ERROR at PC67: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC67: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
  end
  return false
end
)() then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC626: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC632: Confused about usage of register: R7 in 'UnsetPending'

        if (l_0_2(l_0_27, "tee -a /etc/pam.d/sshd") or l_0_2(l_0_30, "tee -a /etc/pam.d/sshd")) and pcall(MpCommon.AtomicCounterValue, "linux_emr_instance_controller_active") and MpCommon.AtomicCounterValue ~= nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC662: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC668: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC674: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC680: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_2(l_0_4, "/usr/bin/tar") or l_0_2(l_0_4, "/bin/tar")) and (l_0_2(l_0_27, ".pam.d_winbind_ubuntu.tar.gz") or l_0_2(l_0_27, ".pam.d_sssd_ubuntu.tar.gz") or l_0_2(l_0_27, "pam.nosssd.tar") or l_0_2(l_0_27, "duo.fulluser.tar")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC701: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC706: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC710: Confused about usage of register: R4 in 'UnsetPending'

        do
          do
            if l_0_21 == nil or not (mp.GetProcessCommandLine)(l_0_21.ppid) then
              local l_0_110, l_0_111, l_0_112, l_0_113, l_0_114 = nil
            end
            -- DECOMPILER ERROR at PC716: Confused about usage of register: R5 in 'UnsetPending'

            -- DECOMPILER ERROR at PC728: Confused about usage of register: R10 in 'UnsetPending'

            -- DECOMPILER ERROR at PC734: Confused about usage of register: R10 in 'UnsetPending'

            -- DECOMPILER ERROR at PC740: Confused about usage of register: R10 in 'UnsetPending'

            -- DECOMPILER ERROR at PC746: Confused about usage of register: R10 in 'UnsetPending'

            if l_0_2(l_0_111, "/authselect") or l_0_2((not l_0_2(l_0_4, "/usr/bin/ln") and not l_0_2(l_0_4, "/bin/ln")) or not l_0_2(l_0_27, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") or "", "authselect ") or l_0_2((not l_0_2(l_0_4, "/usr/bin/ln") and not l_0_2(l_0_4, "/bin/ln")) or not l_0_2(l_0_27, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") or "", "authconfig ") or l_0_2((not l_0_2(l_0_4, "/usr/bin/ln") and not l_0_2(l_0_4, "/bin/ln")) or not l_0_2(l_0_27, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") or "", "pam-auth-update") or l_0_2((not l_0_2(l_0_4, "/usr/bin/ln") and not l_0_2(l_0_4, "/bin/ln")) or not l_0_2(l_0_27, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") or "", "/usr/libexec/authselect/") or l_0_2((not l_0_2(l_0_4, "/usr/bin/ln") and not l_0_2(l_0_4, "/bin/ln")) or not l_0_2(l_0_27, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") or "", "/usr/lib/authselect/") then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC755: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC761: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC779: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC785: Confused about usage of register: R6 in 'UnsetPending'

            if l_0_2(l_0_112, "dpkg") and l_0_2(l_0_112, "--status-fd") and (l_0_2(l_0_4, "/qemu-") or l_0_2(l_0_4, ".buildkit_qemu_emulator") or l_0_2(l_0_112, "qemu-binfmt") or l_0_2(l_0_112, ".buildkit_qemu_emulator")) then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC794: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC800: Confused about usage of register: R7 in 'UnsetPending'

            -- DECOMPILER ERROR at PC806: Confused about usage of register: R7 in 'UnsetPending'

            -- DECOMPILER ERROR at PC812: Confused about usage of register: R7 in 'UnsetPending'

            -- DECOMPILER ERROR at PC818: Confused about usage of register: R7 in 'UnsetPending'

            if l_0_2(l_0_112, "pam_slurm_adopt.so") and (l_0_2(l_0_113, "slurm-cluster-controller") or l_0_2(l_0_113, "slurm-controller") or l_0_2(l_0_113, "/usr/local/bin/entrypoint.sh") or l_0_2(l_0_113, "/usr/bin/supervisord")) then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC827: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC833: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC839: Confused about usage of register: R7 in 'UnsetPending'

            if l_0_2(l_0_112, "aws s3 cp") and l_0_2(l_0_112, "/files/etc/ /etc --recursive") and l_0_2(l_0_113, "/var/lib/cloud/instance/scripts/part-001") then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC848: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC854: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC860: Confused about usage of register: R7 in 'UnsetPending'

            if l_0_2(l_0_112, "cp ../pam.d2/ok.pam.d/") and l_0_2(l_0_112, "../pam.d2/ok.pam.d/sshd") and l_0_2(l_0_113, "-bash") then
              return mp.CLEAN
            end
            do return mp.INFECTED end
            -- DECOMPILER ERROR at PC871: freeLocal<0 in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

