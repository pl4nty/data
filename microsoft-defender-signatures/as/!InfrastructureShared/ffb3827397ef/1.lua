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
    local l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
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
    local l_0_16, l_0_17, l_0_18 = , pcall(bm.get_process_relationships)
    if l_0_18 then
      if bm.get_process_relationships ~= nil then
        for l_0_22,l_0_23 in ipairs(R9_PC161) do
          local l_0_19, l_0_20 = nil
          -- DECOMPILER ERROR at PC163: Confused about usage of register: R12 in 'UnsetPending'

          if R12_PC163.image_path ~= nil then
            (bm.add_related_process)(R12_PC163.ppid)
          end
        end
      end
      do
        -- DECOMPILER ERROR at PC172: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC175: Confused about usage of register: R7 in 'UnsetPending'

        if l_0_20 ~= nil then
          for l_0_27,l_0_28 in ipairs(l_0_20) do
            local l_0_24, l_0_25 = nil
            -- DECOMPILER ERROR at PC178: Confused about usage of register: R12 in 'UnsetPending'

            -- DECOMPILER ERROR at PC183: Confused about usage of register: R12 in 'UnsetPending'

            if R12_PC163.image_path ~= nil then
              (bm.add_related_process)(R12_PC163.ppid)
              -- DECOMPILER ERROR at PC187: Confused about usage of register: R12 in 'UnsetPending'

              if (string.find)(R12_PC163.image_path, "/rpmkeys", 1, true) then
                return mp.CLEAN
              end
              -- DECOMPILER ERROR at PC199: Confused about usage of register: R12 in 'UnsetPending'

              -- DECOMPILER ERROR at PC208: Confused about usage of register: R12 in 'UnsetPending'

              if (string.find)(R12_PC163.image_path, "/dpkg-deb", 1, true) or (string.find)(R12_PC163.image_path, "/dpkg-split", 1, true) then
                return mp.CLEAN
              end
              -- DECOMPILER ERROR at PC218: Confused about usage of register: R12 in 'UnsetPending'

              do
                do
                  local l_0_31 = R12_PC163.cmd_line or ""
                  -- DECOMPILER ERROR at PC224: Confused about usage of register: R13 in 'UnsetPending'

                  if (string.find)(l_0_31, "/var/tmp/rpm-tmp.", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC236: Confused about usage of register: R13 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC245: Confused about usage of register: R13 in 'UnsetPending'

                  if (string.find)(l_0_31, "/usr/bin/dpkg-deb", 1, true) or (string.find)(l_0_31, "/usr/bin/dpkg-split", 1, true) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC255: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC255: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC255: LeaveBlock: unexpected jumping out IF_STMT

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

