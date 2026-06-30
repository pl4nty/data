-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\791b323a46559\1.luac 

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
    local l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_18, l_0_21, l_0_24, l_0_27, l_0_30, l_0_33, l_0_36, l_0_39, l_0_40, l_0_41, l_0_42, l_0_43, l_0_45, l_0_47, l_0_49, l_0_51, l_0_53, l_0_55, l_0_57, l_0_59, l_0_61, l_0_62, l_0_64, l_0_66, l_0_68, l_0_69, l_0_71, l_0_74, l_0_75, l_0_77, l_0_80, l_0_82 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
    do
      local l_0_16, l_0_19, l_0_22, l_0_25, l_0_28, l_0_31, l_0_34, l_0_37, l_0_44, l_0_46, l_0_48, l_0_50, l_0_52, l_0_54, l_0_56, l_0_58, l_0_60, l_0_63, l_0_65, l_0_67, l_0_70, l_0_72, l_0_76, l_0_78, l_0_81, l_0_83 = , l_0_0 ~= nil and l_0_0.command_line or ""
      -- DECOMPILER ERROR at PC39: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC43: Confused about usage of register: R3 in 'UnsetPending'

      do
        local l_0_17, l_0_20, l_0_23, l_0_26, l_0_29, l_0_32, l_0_35, l_0_38, l_0_73, l_0_79, l_0_84 = , l_0_16 ~= nil and (mp.GetProcessCommandLine)(l_0_16.ppid) or ""
        -- DECOMPILER ERROR at PC49: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC55: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC61: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC67: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC73: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC79: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC85: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC91: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC97: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC103: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC109: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_1(l_0_20, "/opt/chef/embedded/bin/ruby") or l_0_1(l_0_20, "/opt/cinc/embedded/bin/ruby") or l_0_1(l_0_20, "/opt/sophos-av/engine/") or l_0_1(l_0_20, "/opt/sophos/engine/") or l_0_1(l_0_20, "/opt/deepinstinct/") or l_0_1(l_0_20, "/opt/VRTSralus/bin/beremote") or l_0_1(l_0_20, "/usr/bin/google_guest_agent") or l_0_1(l_0_20, "/usr/lib/google/guest_agent/") or l_0_1(l_0_20, "/opt/jc/bin/jumpcloud-agent") or l_0_1(l_0_20, "/opt/cyberark/epm/sbin/epmd") or l_0_1(l_0_20, "/opt/puppetlabs/puppet/bin/ruby") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC118: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC124: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC130: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC136: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC142: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC148: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC154: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC160: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_26, "domainjoin-cli") or l_0_1(l_0_26, "/tmp/chef-script") or l_0_1(l_0_26, "/usr/bin/chef-client") or l_0_1(l_0_26, "/usr/bin/cinc-client") or l_0_1(l_0_26, "/opt/chef-workstation/bin/chef-cli") or l_0_1(l_0_26, "/etc/chef/client.rb") or l_0_1(l_0_26, "/etc/cinc/client.rb") or l_0_1(l_0_26, "/usr/lib/skylight/enable_smartcard") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC191: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC195: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC202: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC209: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC216: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC216: Unhandled construct in 'MakeBoolean' P3

        if (l_0_3 ~= "" and (string.match)(l_0_3, "/k3s$")) or l_0_20 ~= "" and ((string.match)(l_0_20, "/k3s$") or (string.match)(l_0_20, "/containerd$") or (string.match)(l_0_20, "/containerd%-shim")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC236: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_3, "/usr/bin/python") or l_0_1(l_0_3, "/python2") or l_0_1(l_0_3, "/python3")) and l_0_1(l_0_23, "/usr/sbin/sosreport") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC258: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC264: Confused about usage of register: R5 in 'UnsetPending'

        if ((string.match)(l_0_3, "/login$") ~= nil or l_0_1(l_0_3, "/bin/login")) and (l_0_1(l_0_23, "/bin/login --") or l_0_1(l_0_23, " login --")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC292: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC298: Confused about usage of register: R5 in 'UnsetPending'

        if ((string.match)(l_0_3, "/rsync$") ~= nil or l_0_1(l_0_3, "/usr/bin/rsync") or l_0_1(l_0_3, "/bin/rsync")) and l_0_1(l_0_23, "rsync -") and not l_0_1(l_0_23, "/etc/pam.d/sshd") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC319: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC325: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC331: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC337: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_3, "/bin/sh") or l_0_1(l_0_3, "/bin/bash")) and l_0_1(l_0_23, "install.sh") and l_0_1(l_0_23, "adbridge-") and l_0_1(l_0_23, ".rpm") and l_0_1(l_0_23, "purge") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC358: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC364: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_3, "/opt/puppetlabs/puppet/bin/ruby") or l_0_1(l_0_3, "/usr/bin/puppet") or l_0_1(l_0_20, "/usr/bin/puppet")) and l_0_1(l_0_23, "puppet agent ") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC373: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC379: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_1(l_0_23, "/usr/local/cpanel/bin/taskrun") and l_0_1(l_0_23, "/var/cpanel/updatelogs/") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC394: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC400: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC406: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC418: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC424: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC430: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC436: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_3, "/opt/aquasec/") or l_0_1(l_0_20, "/opt/aquasec/") or l_0_1(l_0_23, "/opt/aquasec/") or l_0_1(l_0_26, "/opt/aquasec/") or l_0_1(l_0_3, "/var/lib/aquasec/") or l_0_1(l_0_20, "/var/lib/aquasec/") or l_0_1(l_0_23, "/var/lib/aquasec/") or l_0_1(l_0_26, "/var/lib/aquasec/")) and l_0_1(l_0_23, "config_pam_aquasec.sh") then
          return mp.CLEAN
        end
        if (function()
  -- function num : 0_1 , upvalues : l_0_1
  local l_2_1, l_2_2 = pcall(bm.get_process_relationships)
  if not l_2_1 then
    return false
  end
  local l_2_0 = nil
  local l_2_4 = function(l_3_0)
    -- function num : 0_1_0 , upvalues : l_0_1
    if l_3_0 == nil then
      return false
    end
    do
      local l_3_1, l_3_3, l_3_5, l_3_7, l_3_9, l_3_11, l_3_12, l_3_13, l_3_15 = l_3_0.image_path or ""
      do
        local l_3_2, l_3_4, l_3_6, l_3_8, l_3_10, l_3_14, l_3_16 = , l_3_0.cmd_line or ""
        -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

        if (l_0_1(l_3_4, "/opt/aquasec/config_pam_aquasec.sh") or l_0_1(l_3_4, "/var/lib/aquasec/config_pam_aquasec.sh") or l_0_1(l_3_4, "config_pam_aquasec.sh -r")) and (l_0_1(l_3_4, "/opt/aquasec/") or l_0_1(l_3_4, "/var/lib/aquasec/") or l_0_1(l_3_2, "/opt/aquasec/") or l_0_1(l_3_2, "/var/lib/aquasec/")) then
          return true
        end
        -- DECOMPILER ERROR at PC57: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC63: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_1(l_3_4, "/usr/bin/puppet agent ") and l_0_1(l_3_4, "/usr/local/puppet/puppet4_cluster_checkin") then
          return true
        end
        return false
      end
    end
  end

  if not l_2_2 then
    for i_1,i_2 in ipairs({}) do
      if l_2_4(i_2) then
        return true
      end
    end
    local l_2_9 = ipairs
    if not l_2_0 then
      l_2_9 = l_2_9({})
      for i_1,i_2 in l_2_9 do
        if l_2_4(i_2) then
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
        -- DECOMPILER ERROR at PC466: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC472: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC478: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_3, "/bin/sh") or l_0_1(l_0_3, "/bin/bash") or l_0_1(l_0_20, "/bin/sh") or l_0_1(l_0_20, "/bin/bash")) and l_0_1(l_0_23, "04_configure_install_identity.sh") then
          return mp.CLEAN
        end
        if (function()
  -- function num : 0_2 , upvalues : l_0_1, l_0_r5
  local l_3_0 = {}
  -- DECOMPILER ERROR at PC4: No list found for R0 , SetList fails

  -- DECOMPILER ERROR at PC5: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC6: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC7: Overwrote pending register: R3 in 'AssignReg'

  if ("/emr/instance-controller/lib/bootstrap-actions/")("/usr/bin/instance-controller", "aws157.instancecontroller.Main") or l_0_1(l_0_r5, l_3_0[2]) or l_0_1(l_0_r5, l_3_0[3]) then
    return true
  end
  local l_3_1, l_3_2 = pcall(bm.get_process_relationships)
  if not l_3_1 or l_3_2 == nil then
    return false
  end
  for l_3_6,l_3_7 in ipairs(l_3_2) do
    do
      local l_3_8 = l_3_7.image_path or ""
      do
        local l_3_9 = nil
        for l_3_13,l_3_14 in ipairs(l_3_0) do
          local l_3_10, l_3_11 = , l_3_7.cmd_line or ""
          -- DECOMPILER ERROR at PC53: Confused about usage of register: R14 in 'UnsetPending'

          if l_0_1(l_3_10, R14_PC53) or l_0_1(l_3_11, R14_PC53) then
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
        -- DECOMPILER ERROR at PC497: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC503: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_23, "tee -a /etc/pam.d/sshd") or l_0_1(l_0_26, "tee -a /etc/pam.d/sshd")) and pcall(MpCommon.AtomicCounterValue, "linux_emr_instance_controller_active") and MpCommon.AtomicCounterValue ~= nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC533: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC539: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC545: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_3, "/usr/bin/tar") or l_0_1(l_0_3, "/bin/tar")) and (l_0_1(l_0_23, ".pam.d_winbind_ubuntu.tar.gz") or l_0_1(l_0_23, ".pam.d_sssd_ubuntu.tar.gz") or l_0_1(l_0_23, "pam.nosssd.tar")) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC566: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC571: Confused about usage of register: R3 in 'UnsetPending'

        -- DECOMPILER ERROR at PC575: Confused about usage of register: R3 in 'UnsetPending'

        do
          do
            if l_0_17 == nil or not (mp.GetProcessCommandLine)(l_0_17.ppid) then
              local l_0_87, l_0_88, l_0_89, l_0_90, l_0_91 = nil
            end
            -- DECOMPILER ERROR at PC581: Confused about usage of register: R4 in 'UnsetPending'

            -- DECOMPILER ERROR at PC593: Confused about usage of register: R9 in 'UnsetPending'

            -- DECOMPILER ERROR at PC599: Confused about usage of register: R9 in 'UnsetPending'

            -- DECOMPILER ERROR at PC605: Confused about usage of register: R9 in 'UnsetPending'

            -- DECOMPILER ERROR at PC611: Confused about usage of register: R9 in 'UnsetPending'

            if l_0_1(l_0_88, "/authselect") or l_0_1((not l_0_1(l_0_3, "/usr/bin/ln") and not l_0_1(l_0_3, "/bin/ln")) or not l_0_1(l_0_23, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") or "", "authselect ") or l_0_1((not l_0_1(l_0_3, "/usr/bin/ln") and not l_0_1(l_0_3, "/bin/ln")) or not l_0_1(l_0_23, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") or "", "authconfig ") or l_0_1((not l_0_1(l_0_3, "/usr/bin/ln") and not l_0_1(l_0_3, "/bin/ln")) or not l_0_1(l_0_23, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") or "", "pam-auth-update") or l_0_1((not l_0_1(l_0_3, "/usr/bin/ln") and not l_0_1(l_0_3, "/bin/ln")) or not l_0_1(l_0_23, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") or "", "/usr/libexec/authselect/") or l_0_1((not l_0_1(l_0_3, "/usr/bin/ln") and not l_0_1(l_0_3, "/bin/ln")) or not l_0_1(l_0_23, "ln -sf /etc/pam.d/system-auth /etc/pam.d/sshd") or "", "/usr/lib/authselect/") then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC620: Confused about usage of register: R5 in 'UnsetPending'

            -- DECOMPILER ERROR at PC626: Confused about usage of register: R5 in 'UnsetPending'

            -- DECOMPILER ERROR at PC644: Confused about usage of register: R5 in 'UnsetPending'

            -- DECOMPILER ERROR at PC650: Confused about usage of register: R5 in 'UnsetPending'

            if l_0_1(l_0_89, "dpkg") and l_0_1(l_0_89, "--status-fd") and (l_0_1(l_0_3, "/qemu-") or l_0_1(l_0_3, ".buildkit_qemu_emulator") or l_0_1(l_0_89, "qemu-binfmt") or l_0_1(l_0_89, ".buildkit_qemu_emulator")) then
              return mp.CLEAN
            end
            do return mp.INFECTED end
            -- DECOMPILER ERROR at PC661: freeLocal<0 in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

