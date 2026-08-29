-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\920b38576f8bf\1.luac 

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
  local l_0_3, l_0_4, l_0_5, l_0_6 = (bm.get_imagepath)() or ""
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC43: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC50: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC57: Confused about usage of register: R3 in 'UnsetPending'

  if l_0_3 ~= "" and ((string.match)(l_0_3, "/k3s$") or (string.match)(l_0_3, "/containerd$") or (string.match)(l_0_3, "/containerd%-shim")) then
    return mp.CLEAN
  end
  local l_0_7 = nil
  do
    local l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16, l_0_19, l_0_22, l_0_25, l_0_28, l_0_31, l_0_34, l_0_37, l_0_40, l_0_43, l_0_46, l_0_48, l_0_50, l_0_52, l_0_54 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
    -- DECOMPILER ERROR at PC74: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC78: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC85: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC92: Confused about usage of register: R5 in 'UnsetPending'

    if l_0_9 ~= "" and ((string.match)(l_0_9, "/k3s$") or (string.match)(l_0_9, "/containerd$") or (string.match)(l_0_9, "/containerd%-shim")) then
      return mp.CLEAN
    end
    do
      local l_0_17, l_0_20, l_0_23, l_0_26, l_0_29, l_0_32, l_0_35, l_0_38, l_0_41, l_0_44, l_0_47, l_0_49, l_0_51, l_0_53, l_0_55 = , l_0_1 ~= nil and l_0_1.command_line or ""
      -- DECOMPILER ERROR at PC106: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC110: Confused about usage of register: R4 in 'UnsetPending'

      do
        local l_0_18, l_0_21, l_0_24, l_0_27, l_0_30, l_0_33, l_0_36, l_0_39, l_0_42, l_0_45, l_0_56 = , l_0_17 ~= nil and (mp.GetProcessCommandLine)(l_0_17.ppid) or ""
        -- DECOMPILER ERROR at PC115: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_24 == "" and (l_0_2(l_0_7, "/python") or l_0_2(l_0_7, "/platform-python") or l_0_2(l_0_7, "/perl") or l_0_2(l_0_7, "/qemu-")) then
          if l_0_0("linux_pkg_maintenance_active") then
            return mp.CLEAN
          end
          if l_0_0("linux_config_mgmt_active") then
            return mp.CLEAN
          end
        end
        -- DECOMPILER ERROR at PC158: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC164: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC170: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC176: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC182: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_2(l_0_21, "/opt/sophos-av/engine/") or l_0_2(l_0_21, "/opt/sophos/engine/") or l_0_2(l_0_21, "/opt/deepinstinct/") or l_0_2(l_0_21, "/opt/kaspersky/kesl/") or l_0_2(l_0_21, "/opt/VRTSralus/bin/beremote") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC191: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC197: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC203: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC209: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC215: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC221: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC227: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC233: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC239: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC245: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_2(l_0_27, "/opt/deepinstinct/") or l_0_2(l_0_27, "/usr/sbin/debootstrap") or l_0_2(l_0_27, "/usr/bin/xClient 01010011011011100110111101110111") or l_0_2(l_0_27, "/var/cache/apt/archives/") or l_0_2(l_0_27, "libpam-modules-bin") or l_0_2(l_0_27, "/usr/lib/apt/apt.systemd.daily") or l_0_2(l_0_27, "/usr/sbin/needrestart") or l_0_2(l_0_27, "/usr/bin/apt-key --quiet") or l_0_2(l_0_27, "/usr/libexec/qemu-binfmt/") or l_0_2(l_0_27, "apk add ") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC266: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC272: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC278: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC284: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_2(l_0_7, "/usr/sbin/recover") or l_0_2(l_0_7, "/usr/bin/recover")) and l_0_2(l_0_24, "/usr/sbin/recover -s ") and l_0_2(l_0_24, " -a ") and l_0_2(l_0_24, " -I -") and l_0_2(l_0_24, " -x ") then
          return mp.CLEAN
        end
        local l_0_57, l_0_58, l_0_59 = nil
        if pcall(bm.get_process_relationships) then
          if bm.get_process_relationships ~= nil then
            for l_0_63,l_0_64 in ipairs(R12_PC302) do
              local l_0_60, l_0_61, l_0_62, l_0_63 = nil
              -- DECOMPILER ERROR at PC304: Confused about usage of register: R15 in 'UnsetPending'

              -- DECOMPILER ERROR at PC309: Confused about usage of register: R15 in 'UnsetPending'

              if l_0_49.image_path ~= nil then
                (bm.add_related_process)(l_0_49.ppid)
              end
            end
          end
          do
            -- DECOMPILER ERROR at PC313: Confused about usage of register: R10 in 'UnsetPending'

            -- DECOMPILER ERROR at PC316: Confused about usage of register: R10 in 'UnsetPending'

            if l_0_63 ~= nil then
              for l_0_68,l_0_69 in ipairs(l_0_63) do
                local l_0_65, l_0_66, l_0_67, l_0_68 = nil
                -- DECOMPILER ERROR at PC319: Confused about usage of register: R15 in 'UnsetPending'

                -- DECOMPILER ERROR at PC324: Confused about usage of register: R15 in 'UnsetPending'

                if l_0_49.image_path ~= nil then
                  (bm.add_related_process)(l_0_49.ppid)
                  -- DECOMPILER ERROR at PC328: Confused about usage of register: R15 in 'UnsetPending'

                  if (string.find)(l_0_49.image_path, "/rpmkeys", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC340: Confused about usage of register: R15 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC349: Confused about usage of register: R15 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC358: Confused about usage of register: R15 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC367: Confused about usage of register: R15 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC376: Confused about usage of register: R15 in 'UnsetPending'

                  if (string.find)(l_0_49.image_path, "/dpkg-deb", 1, true) or (string.find)(l_0_49.image_path, "/dpkg-split", 1, true) or (string.find)(l_0_49.image_path, "/bin/dpkg", 1, true) or (string.find)(l_0_49.image_path, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_49.image_path, "/bin/dpkg-split", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC386: Confused about usage of register: R15 in 'UnsetPending'

                  do
                    do
                      local l_0_74, l_0_75 = l_0_49.cmd_line or ""
                      -- DECOMPILER ERROR at PC392: Confused about usage of register: R16 in 'UnsetPending'

                      if (string.find)(l_0_74, "/var/tmp/rpm-tmp.", 1, true) then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC404: Confused about usage of register: R16 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC413: Confused about usage of register: R16 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC422: Confused about usage of register: R16 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC431: Confused about usage of register: R16 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC440: Confused about usage of register: R16 in 'UnsetPending'

                      if (string.find)(l_0_74, "/usr/bin/dpkg-deb", 1, true) or (string.find)(l_0_74, "/usr/bin/dpkg-split", 1, true) or (string.find)(l_0_74, "/bin/dpkg ", 1, true) or (string.find)(l_0_74, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_74, "/bin/dpkg-split", 1, true) then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC450: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC450: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC450: LeaveBlock: unexpected jumping out IF_STMT

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

