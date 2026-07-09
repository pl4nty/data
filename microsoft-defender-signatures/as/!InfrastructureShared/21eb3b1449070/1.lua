-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21eb3b1449070\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  if l_1_0 == nil then
    return l_1_1
  end
  if l_1_1 == nil then
    return l_1_0
  end
  if l_1_1 < l_1_0 then
    return l_1_1
  end
  return l_1_0
end

local l_0_1 = function(l_2_0)
  -- function num : 0_1
  if l_2_0 ~= nil and l_2_0.matched and l_2_0.timestamp ~= nil then
    return l_2_0.timestamp
  end
  return nil
end

local l_0_2 = l_0_1(this_sigattrlog[8])
l_0_2 = l_0_0(l_0_2, l_0_1(this_sigattrlog[9]))
local l_0_3 = l_0_1(this_sigattrlog[10])
l_0_3 = l_0_0(l_0_3, l_0_1(this_sigattrlog[11]))
l_0_3 = l_0_0(l_0_3, l_0_1(this_sigattrlog[12]))
l_0_3 = l_0_0(l_0_3, l_0_1(this_sigattrlog[13]))
if l_0_2 == nil or l_0_3 == nil or l_0_3 <= l_0_2 then
  return mp.CLEAN
end
local l_0_4 = function(l_3_0)
  -- function num : 0_2
  if l_3_0 ~= nil and l_3_0.matched and l_3_0.utf8p1 ~= nil then
    return l_3_0.utf8p1
  end
  return nil
end

do
  if l_0_4(this_sigattrlog[8]) == nil then
    local l_0_5, l_0_6, l_0_7 = l_0_4(this_sigattrlog[9])
  end
  local l_0_8 = nil
  if l_0_8 ~= nil then
    if ((string.find)(l_0_8, "/tmp/hsperfdata_amssys/", 1, true) or (string.find)(l_0_8, "/tmp/output_fileSsh.tmp.", 1, true)) and (function(l_4_0)
  -- function num : 0_3
  local l_4_1, l_4_2, l_4_3 = pcall(bm.get_process_relationships)
  if not l_4_1 then
    return false
  end
  local l_4_4 = ipairs
  if not l_4_2 then
    l_4_4 = l_4_4({})
    for i_1,i_2 in l_4_4 do
      do
        local l_4_10 = i_2.cmd_line or ""
        -- DECOMPILER ERROR at PC18: Confused about usage of register: R8 in 'UnsetPending'

        do
          do
            local l_4_11 = nil
            -- DECOMPILER ERROR at PC24: Confused about usage of register: R9 in 'UnsetPending'

            if (string.find)(l_4_10, l_4_0, 1, true) or (string.find)(l_4_9.image_path or "", l_4_0, 1, true) then
              return true
            end
            -- DECOMPILER ERROR at PC42: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC42: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
    end
    local l_4_12 = nil
    if not l_4_3 then
      for i_1,i_2 in ipairs(l_4_12) do
        do
          local l_4_17, l_4_18 = l_4_16.cmd_line or ""
          do
            do
              local l_4_19 = nil
              -- DECOMPILER ERROR at PC60: Confused about usage of register: R9 in 'UnsetPending'

              if (string.find)(l_4_19, l_4_0, 1, true) or (string.find)(l_4_16.image_path or "", l_4_0, 1, true) then
                return true
              end
              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out DO_STMT

            end
          end
        end
      end
      do return false end
      -- DECOMPILER ERROR at PC82: Confused about usage of register R5 for local variables in 'ReleaseLocals'

    end
  end
end
)("amsapp_appserver.sh") then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC101: Confused about usage of register: R6 in 'UnsetPending'

    if (string.find)(l_0_8, "/tmp/body.", 1, true) and (function(l_4_0)
  -- function num : 0_3
  local l_4_1, l_4_2, l_4_3 = pcall(bm.get_process_relationships)
  if not l_4_1 then
    return false
  end
  local l_4_4 = ipairs
  if not l_4_2 then
    l_4_4 = l_4_4({})
    for i_1,i_2 in l_4_4 do
      do
        local l_4_10 = i_2.cmd_line or ""
        -- DECOMPILER ERROR at PC18: Confused about usage of register: R8 in 'UnsetPending'

        do
          do
            local l_4_11 = nil
            -- DECOMPILER ERROR at PC24: Confused about usage of register: R9 in 'UnsetPending'

            if (string.find)(l_4_10, l_4_0, 1, true) or (string.find)(l_4_9.image_path or "", l_4_0, 1, true) then
              return true
            end
            -- DECOMPILER ERROR at PC42: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC42: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
    end
    local l_4_12 = nil
    if not l_4_3 then
      for i_1,i_2 in ipairs(l_4_12) do
        do
          local l_4_17, l_4_18 = l_4_16.cmd_line or ""
          do
            do
              local l_4_19 = nil
              -- DECOMPILER ERROR at PC60: Confused about usage of register: R9 in 'UnsetPending'

              if (string.find)(l_4_19, l_4_0, 1, true) or (string.find)(l_4_16.image_path or "", l_4_0, 1, true) then
                return true
              end
              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out DO_STMT

            end
          end
        end
      end
      do return false end
      -- DECOMPILER ERROR at PC82: Confused about usage of register R5 for local variables in 'ReleaseLocals'

    end
  end
end
)("sftp_test_sap") then
      return mp.CLEAN
    end
  end
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end

