-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ffb3827397ef\1.luac 

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
    local l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_17, l_0_19, l_0_20, l_0_23, l_0_26, l_0_28, l_0_31 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC63: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC70: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC77: Confused about usage of register: R4 in 'UnsetPending'

    if l_0_8 ~= "" and ((string.match)(l_0_8, "/k3s$") or (string.match)(l_0_8, "/containerd$") or (string.match)(l_0_8, "/containerd%-shim")) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC104: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC116: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC128: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC135: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC135: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC135: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC135: Unhandled construct in 'MakeBoolean' P3

    if (l_0_1(l_0_6, "/opt/kaspersky/kesl/") and l_0_1(l_0_6, "/libexec/kesl")) or not l_0_1(l_0_8, "/opt/kaspersky/kesl/") or l_0_1(l_0_8, "/sophos/engine/_/savscand.") then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC143: Confused about usage of register: R4 in 'UnsetPending'

    if l_0_1(l_0_6, "/opt/VRTSralus/bin/beremote") or l_0_1(l_0_8, "/opt/VRTSralus/bin/beremote") then
      return mp.CLEAN
    end
    do
      local l_0_16, l_0_18, l_0_21, l_0_24, l_0_27, l_0_29, l_0_32 = , l_0_0 ~= nil and l_0_0.command_line or ""
      -- DECOMPILER ERROR at PC157: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC161: Confused about usage of register: R3 in 'UnsetPending'

      do
        local l_0_22, l_0_25, l_0_30, l_0_33 = , l_0_16 ~= nil and (mp.GetProcessCommandLine)(l_0_16.ppid) or ""
        -- DECOMPILER ERROR at PC173: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC179: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC185: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC191: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC197: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC203: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC209: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC216: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC216: Unhandled construct in 'MakeBoolean' P3

        if (l_0_1(l_0_6, "qemu-aarch64") and l_0_1(l_0_30, "/bin/dpkg") and l_0_1(l_0_30, "/var/cache/apt/archives/")) or not l_0_1(l_0_25, "qemu-aarch64") or not l_0_1(l_0_33, "/bin/dpkg") or l_0_1(l_0_33, "/usr/sbin/debootstrap") then
          return mp.CLEAN
        end
        local l_0_34, l_0_35, l_0_36 = nil
        if pcall(bm.get_process_relationships) then
          if bm.get_process_relationships ~= nil then
            for l_0_40,l_0_41 in ipairs(R11_PC227) do
              local l_0_37, l_0_38, l_0_39, l_0_40 = nil
              -- DECOMPILER ERROR at PC229: Confused about usage of register: R14 in 'UnsetPending'

              -- DECOMPILER ERROR at PC234: Confused about usage of register: R14 in 'UnsetPending'

              if l_0_20.image_path ~= nil then
                (bm.add_related_process)(l_0_20.ppid)
              end
            end
          end
          do
            -- DECOMPILER ERROR at PC238: Confused about usage of register: R9 in 'UnsetPending'

            -- DECOMPILER ERROR at PC241: Confused about usage of register: R9 in 'UnsetPending'

            if l_0_40 ~= nil then
              for l_0_45,l_0_46 in ipairs(l_0_40) do
                local l_0_42, l_0_43, l_0_44, l_0_45 = nil
                -- DECOMPILER ERROR at PC244: Confused about usage of register: R14 in 'UnsetPending'

                -- DECOMPILER ERROR at PC249: Confused about usage of register: R14 in 'UnsetPending'

                if l_0_20.image_path ~= nil then
                  (bm.add_related_process)(l_0_20.ppid)
                  -- DECOMPILER ERROR at PC253: Confused about usage of register: R14 in 'UnsetPending'

                  if (string.find)(l_0_20.image_path, "/rpmkeys", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC265: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC274: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC283: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC292: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC301: Confused about usage of register: R14 in 'UnsetPending'

                  if (string.find)(l_0_20.image_path, "/dpkg-deb", 1, true) or (string.find)(l_0_20.image_path, "/dpkg-split", 1, true) or (string.find)(l_0_20.image_path, "/bin/dpkg", 1, true) or (string.find)(l_0_20.image_path, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_20.image_path, "/bin/dpkg-split", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC311: Confused about usage of register: R14 in 'UnsetPending'

                  do
                    do
                      local l_0_51, l_0_52 = l_0_20.cmd_line or ""
                      -- DECOMPILER ERROR at PC317: Confused about usage of register: R15 in 'UnsetPending'

                      if (string.find)(l_0_51, "/var/tmp/rpm-tmp.", 1, true) then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC329: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC338: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC347: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC356: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC365: Confused about usage of register: R15 in 'UnsetPending'

                      if (string.find)(l_0_51, "/usr/bin/dpkg-deb", 1, true) or (string.find)(l_0_51, "/usr/bin/dpkg-split", 1, true) or (string.find)(l_0_51, "/bin/dpkg ", 1, true) or (string.find)(l_0_51, "/bin/dpkg-deb", 1, true) or (string.find)(l_0_51, "/bin/dpkg-split", 1, true) then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC375: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC375: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC375: LeaveBlock: unexpected jumping out IF_STMT

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

