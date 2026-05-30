-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f5b32ab67b26\1.luac 

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
    local l_0_4, l_0_5, l_0_6, l_0_7, l_0_9, l_0_12, l_0_14, l_0_17, l_0_18, l_0_19, l_0_20, l_0_21, l_0_23, l_0_24, l_0_27, l_0_29, l_0_31, l_0_32, l_0_35, l_0_38 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
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
      local l_0_8, l_0_10, l_0_13, l_0_15, l_0_22, l_0_25, l_0_28, l_0_30, l_0_33, l_0_36, l_0_39 = , l_0_0 ~= nil and l_0_0.command_line or ""
      -- DECOMPILER ERROR at PC88: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC92: Confused about usage of register: R3 in 'UnsetPending'

      do
        local l_0_11, l_0_16, l_0_26, l_0_34, l_0_37, l_0_40 = , l_0_8 ~= nil and (mp.GetProcessCommandLine)(l_0_8.ppid) or ""
        -- DECOMPILER ERROR at PC98: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC104: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_26, "/aquasec/") or l_0_1(l_0_34, "/aquasec/") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC113: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC119: Confused about usage of register: R6 in 'UnsetPending'

        if l_0_1(l_0_26, "/opt/CA/AccessControl/") or l_0_1(l_0_34, "/opt/CA/AccessControl/") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC140: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC146: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC158: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC165: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC165: Unhandled construct in 'MakeBoolean' P3

        if (l_0_1(l_0_3, "/opt/kaspersky/kesl/") and l_0_1(l_0_3, "/libexec/kesl")) or not l_0_1(l_0_16, "/opt/kaspersky/kesl/") or l_0_1(l_0_16, "/opt/sophos-av/engine/_/savscand.") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC173: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_1(l_0_3, "/opt/VRTSralus/bin/beremote") or l_0_1(l_0_16, "/opt/VRTSralus/bin/beremote") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC188: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC194: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC200: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_3, "/opt/MXB/bin/BackupFP") and l_0_1(l_0_26, "/opt/MXB/bin/BackupFP")) or l_0_1(l_0_16, "/opt/MXB/bin/BackupFP") and l_0_1(l_0_34, "/opt/MXB/bin/BackupFP") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC215: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC221: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC227: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC233: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC239: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_3, "keytool") and l_0_1(l_0_26, "-importcert") and l_0_1(l_0_26, "-keystore /lib/security/cacerts")) or l_0_1(l_0_16, "keytool") and l_0_1(l_0_34, "-importcert") and l_0_1(l_0_34, "-keystore /lib/security/cacerts") then
          return mp.CLEAN
        end
        local l_0_41, l_0_42, l_0_43 = nil
        if pcall(bm.get_process_relationships) then
          if bm.get_process_relationships ~= nil then
            for l_0_47,l_0_48 in ipairs(R11_PC257) do
              local l_0_44, l_0_45, l_0_46, l_0_47 = nil
              -- DECOMPILER ERROR at PC259: Confused about usage of register: R14 in 'UnsetPending'

              -- DECOMPILER ERROR at PC264: Confused about usage of register: R14 in 'UnsetPending'

              if l_0_21.image_path ~= nil then
                (bm.add_related_process)(l_0_21.ppid)
              end
            end
          end
          do
            -- DECOMPILER ERROR at PC268: Confused about usage of register: R9 in 'UnsetPending'

            -- DECOMPILER ERROR at PC271: Confused about usage of register: R9 in 'UnsetPending'

            if l_0_47 ~= nil then
              for l_0_52,l_0_53 in ipairs(l_0_47) do
                local l_0_49, l_0_50, l_0_51, l_0_52 = nil
                -- DECOMPILER ERROR at PC274: Confused about usage of register: R14 in 'UnsetPending'

                -- DECOMPILER ERROR at PC279: Confused about usage of register: R14 in 'UnsetPending'

                if l_0_21.image_path ~= nil then
                  (bm.add_related_process)(l_0_21.ppid)
                  -- DECOMPILER ERROR at PC283: Confused about usage of register: R14 in 'UnsetPending'

                  if (string.find)(l_0_21.image_path, "/rpmkeys", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC295: Confused about usage of register: R14 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC304: Confused about usage of register: R14 in 'UnsetPending'

                  if (string.find)(l_0_21.image_path, "/dpkg-deb", 1, true) or (string.find)(l_0_21.image_path, "/dpkg-split", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC314: Confused about usage of register: R14 in 'UnsetPending'

                  do
                    do
                      if (string.find)(l_0_21.cmd_line or "", "/var/tmp/rpm-tmp.", 1, true) then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC332: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC341: Confused about usage of register: R15 in 'UnsetPending'

                      if (string.find)(l_0_21.cmd_line or "", "/usr/bin/dpkg-deb", 1, true) or (string.find)(l_0_21.cmd_line or "", "/usr/bin/dpkg-split", 1, true) then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC351: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC351: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC351: LeaveBlock: unexpected jumping out IF_STMT

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

