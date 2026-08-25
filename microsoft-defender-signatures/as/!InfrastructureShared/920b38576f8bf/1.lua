-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\920b38576f8bf\1.luac 

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
  local l_0_2, l_0_3, l_0_4, l_0_5 = (bm.get_imagepath)() or ""
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC28: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

  if l_0_2 ~= "" and ((string.match)(l_0_2, "/k3s$") or (string.match)(l_0_2, "/containerd$") or (string.match)(l_0_2, "/containerd%-shim")) then
    return mp.CLEAN
  end
  local l_0_6 = nil
  do
    local l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_18, l_0_21, l_0_24, l_0_27, l_0_30, l_0_32, l_0_34, l_0_36, l_0_38 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC63: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC70: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC77: Confused about usage of register: R4 in 'UnsetPending'

    if l_0_8 ~= "" and ((string.match)(l_0_8, "/k3s$") or (string.match)(l_0_8, "/containerd$") or (string.match)(l_0_8, "/containerd%-shim")) then
      return mp.CLEAN
    end
    do
      local l_0_16, l_0_19, l_0_22, l_0_25, l_0_28, l_0_31, l_0_33, l_0_35, l_0_37, l_0_39 = , l_0_0 ~= nil and l_0_0.command_line or ""
      -- DECOMPILER ERROR at PC91: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC95: Confused about usage of register: R3 in 'UnsetPending'

      do
        local l_0_17, l_0_20, l_0_23, l_0_26, l_0_29, l_0_40 = , l_0_16 ~= nil and (mp.GetProcessCommandLine)(l_0_16.ppid) or ""
        -- DECOMPILER ERROR at PC100: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_23 == "" and (l_0_1(l_0_6, "/python") or l_0_1(l_0_6, "/platform-python") or l_0_1(l_0_6, "/perl")) then
          if pcall(MpCommon.AtomicCounterValue, "linux_pkg_maintenance_active") and MpCommon.AtomicCounterValue ~= nil then
            return mp.CLEAN
          end
          if pcall(MpCommon.AtomicCounterValue, "linux_config_mgmt_active") and MpCommon.AtomicCounterValue ~= nil then
            return mp.CLEAN
          end
        end
        -- DECOMPILER ERROR at PC145: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC151: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC157: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC163: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC169: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_1(l_0_20, "/opt/sophos-av/engine/") or l_0_1(l_0_20, "/opt/sophos/engine/") or l_0_1(l_0_20, "/opt/deepinstinct/") or l_0_1(l_0_20, "/opt/kaspersky/kesl/") or l_0_1(l_0_20, "/opt/VRTSralus/bin/beremote") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC178: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC184: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC190: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC196: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC202: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_26, "/opt/deepinstinct/") or l_0_1(l_0_26, "/usr/sbin/debootstrap") or l_0_1(l_0_26, "/usr/bin/xClient 01010011011011100110111101110111") or l_0_1(l_0_26, "/var/cache/apt/archives/") or l_0_1(l_0_26, "libpam-modules-bin") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC223: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC229: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC235: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC241: Confused about usage of register: R5 in 'UnsetPending'

        if (l_0_1(l_0_6, "/usr/sbin/recover") or l_0_1(l_0_6, "/usr/bin/recover")) and l_0_1(l_0_23, "/usr/sbin/recover -s ") and l_0_1(l_0_23, " -a ") and l_0_1(l_0_23, " -I -") and l_0_1(l_0_23, " -x ") then
          return mp.CLEAN
        end
        local l_0_41, l_0_42, l_0_43 = nil
        if pcall(bm.get_process_relationships) then
          if bm.get_process_relationships ~= nil then
            for l_0_47,l_0_48 in ipairs(R11_PC259) do
              local l_0_44, l_0_45, l_0_46, l_0_47 = nil
              -- DECOMPILER ERROR at PC261: Confused about usage of register: R14 in 'UnsetPending'

              -- DECOMPILER ERROR at PC266: Confused about usage of register: R14 in 'UnsetPending'

              if l_0_24.image_path ~= nil then
                (bm.add_related_process)(l_0_24.ppid)
              end
            end
          end
          do
            -- DECOMPILER ERROR at PC270: Confused about usage of register: R9 in 'UnsetPending'

            -- DECOMPILER ERROR at PC273: Confused about usage of register: R9 in 'UnsetPending'

            if l_0_47 ~= nil then
              for l_0_52,l_0_53 in ipairs(l_0_47) do
                local l_0_49, l_0_50, l_0_51, l_0_52 = nil
                -- DECOMPILER ERROR at PC276: Confused about usage of register: R14 in 'UnsetPending'

                -- DECOMPILER ERROR at PC281: Confused about usage of register: R14 in 'UnsetPending'

                if l_0_24.image_path ~= nil then
                  (bm.add_related_process)(l_0_24.ppid)
                  -- DECOMPILER ERROR at PC285: Confused about usage of register: R14 in 'UnsetPending'

                  if (string.find)(l_0_24.image_path, "/rpmkeys", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC297: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC306: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC315: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC324: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC333: Confused about usage of register: R14 in 'UnsetPending'

                  if (string.find)(l_0_24.image_path, "/dpkg-deb", 1, true) or (string.find)(l_0_24.image_path, "/dpkg-split", 1, true) or (string.find)(l_0_24.image_path, "/bin/dpkg", 1, true) or (string.find)(l_0_24.image_path, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_24.image_path, "/bin/dpkg-split", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC343: Confused about usage of register: R14 in 'UnsetPending'

                  do
                    do
                      local l_0_58, l_0_59 = l_0_24.cmd_line or ""
                      -- DECOMPILER ERROR at PC349: Confused about usage of register: R15 in 'UnsetPending'

                      if (string.find)(l_0_58, "/var/tmp/rpm-tmp.", 1, true) then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC361: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC370: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC379: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC388: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC397: Confused about usage of register: R15 in 'UnsetPending'

                      if (string.find)(l_0_58, "/usr/bin/dpkg-deb", 1, true) or (string.find)(l_0_58, "/usr/bin/dpkg-split", 1, true) or (string.find)(l_0_58, "/bin/dpkg ", 1, true) or (string.find)(l_0_58, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_58, "/bin/dpkg-split", 1, true) then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC407: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC407: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC407: LeaveBlock: unexpected jumping out IF_STMT

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

