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
    local l_0_4, l_0_5, l_0_6, l_0_7, l_0_9, l_0_11, l_0_14, l_0_17, l_0_18, l_0_19, l_0_20, l_0_21, l_0_23, l_0_24, l_0_27, l_0_29, l_0_31, l_0_32, l_0_35, l_0_38, l_0_41 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
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
      local l_0_8, l_0_10, l_0_12, l_0_15, l_0_22, l_0_25, l_0_28, l_0_30, l_0_33, l_0_36, l_0_39, l_0_42 = , l_0_0 ~= nil and l_0_0.command_line or ""
      -- DECOMPILER ERROR at PC88: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC92: Confused about usage of register: R3 in 'UnsetPending'

      do
        local l_0_13, l_0_16, l_0_26, l_0_34, l_0_37, l_0_40, l_0_43 = , l_0_8 ~= nil and (mp.GetProcessCommandLine)(l_0_8.ppid) or ""
        -- DECOMPILER ERROR at PC98: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC104: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC110: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC116: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_26, "/opt/aquasec/") and l_0_1(l_0_26, "aquasec-agent")) or l_0_1(l_0_34, "/opt/aquasec/") and l_0_1(l_0_34, "aquasec-agent") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC137: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC143: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC155: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC162: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC162: Unhandled construct in 'MakeBoolean' P3

        if (l_0_1(l_0_3, "/opt/kaspersky/kesl/") and l_0_1(l_0_3, "/libexec/kesl")) or not l_0_1(l_0_16, "/opt/kaspersky/kesl/") or l_0_1(l_0_16, "/opt/sophos-av/engine/_/savscand.") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC170: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_1(l_0_3, "/opt/VRTSralus/bin/beremote") or l_0_1(l_0_16, "/opt/VRTSralus/bin/beremote") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC185: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC191: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC197: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_3, "/opt/MXB/bin/BackupFP") and l_0_1(l_0_26, "/opt/MXB/bin/BackupFP")) or l_0_1(l_0_16, "/opt/MXB/bin/BackupFP") and l_0_1(l_0_34, "/opt/MXB/bin/BackupFP") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC212: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC218: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC224: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC230: Confused about usage of register: R6 in 'UnsetPending'

        -- DECOMPILER ERROR at PC236: Confused about usage of register: R6 in 'UnsetPending'

        if (l_0_1(l_0_3, "keytool") and l_0_1(l_0_26, "-importcert") and l_0_1(l_0_26, "-keystore /lib/security/cacerts")) or l_0_1(l_0_16, "keytool") and l_0_1(l_0_34, "-importcert") and l_0_1(l_0_34, "-keystore /lib/security/cacerts") then
          return mp.CLEAN
        end
        addRelatedProcess()
        reportRelatedBmHits()
        return mp.INFECTED
      end
    end
  end
end

