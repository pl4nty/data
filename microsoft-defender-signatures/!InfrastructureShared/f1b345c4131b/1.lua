-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f1b345c4131b\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
if not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p2 == nil or (this_sigattrlog[6]).utf8p2 == "" or (this_sigattrlog[6]).utf8p1 == nil or (this_sigattrlog[6]).utf8p1 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC45: Overwrote pending register: R2 in 'AssignReg'

do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
    local l_0_2, l_0_5, l_0_7, l_0_8, l_0_10, l_0_11, l_0_13 = , nil, nil
  end
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

  if not SuspMacPathsToMonitor(l_0_7, true) then
    return mp.CLEAN
  end
  local l_0_4 = nil
  local l_0_3 = (this_sigattrlog[6]).utf8p2
  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
      local l_0_6, l_0_9, l_0_12, l_0_14 = , (this_sigattrlog[2]).utf8p2
    else
    end
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC106: Confused about usage of register: R2 in 'UnsetPending'

    do
      if (not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" or l_0_6 ~= nil) and l_0_4 ~= nil and l_0_3 ~= nil and (this_sigattrlog[3]).utf8p2 ~= nil then
        local l_0_15 = nil
        -- DECOMPILER ERROR at PC111: Confused about usage of register: R3 in 'UnsetPending'

        if not (string.find)((this_sigattrlog[3]).utf8p2, l_0_6:match("[^/]*$"), 1, true) then
          return mp.CLEAN
        end
        if l_0_15 == l_0_4 or (string.find)(l_0_3, l_0_6:match("[^/]*$"), 1, true) then
          return mp.INFECTED
        end
      end
      return mp.CLEAN
    end
  end
end

