-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\234b3de919415\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 60
local l_0_1 = {}
local l_0_2 = {}
-- DECOMPILER ERROR at PC47: Overwrote pending register: R3 in 'AssignReg'

do
  do
    if ((MpCommon.GetPersistContextNoPath)("createdFiles_set_redline") ~= nil and (MpCommon.GetPersistContextNoPath)("procCreated_set_redline") == nil) or (MpCommon.GetPersistContextNoPath)("procInj_set_redline") ~= nil then
      local l_0_3 = {}
    end
    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
      (function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_1, l_0_0
  if l_1_0 == nil or l_0_1 == nil then
    return 
  end
  for l_1_4,l_1_5 in ipairs(l_0_1) do
    if l_1_5 == l_1_0 then
      return 
    end
  end
  ;
  (table.insert)(l_0_1, l_1_0)
  ;
  (MpCommon.SetPersistContextNoPath)("createdFiles_set_redline", l_0_1, l_0_0)
end
)((string.lower)((this_sigattrlog[4]).utf8p1))
    end
    -- DECOMPILER ERROR at PC76: Confused about usage of register: R4 in 'UnsetPending'

    if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
      (function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_1, l_0_0
  if l_1_0 == nil or l_0_1 == nil then
    return 
  end
  for l_1_4,l_1_5 in ipairs(l_0_1) do
    if l_1_5 == l_1_0 then
      return 
    end
  end
  ;
  (table.insert)(l_0_1, l_1_0)
  ;
  (MpCommon.SetPersistContextNoPath)("createdFiles_set_redline", l_0_1, l_0_0)
end
)((string.lower)((this_sigattrlog[5]).utf8p1))
    end
    -- DECOMPILER ERROR at PC94: Confused about usage of register: R4 in 'UnsetPending'

    if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
      (function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_1, l_0_0
  if l_1_0 == nil or l_0_1 == nil then
    return 
  end
  for l_1_4,l_1_5 in ipairs(l_0_1) do
    if l_1_5 == l_1_0 then
      return 
    end
  end
  ;
  (table.insert)(l_0_1, l_1_0)
  ;
  (MpCommon.SetPersistContextNoPath)("createdFiles_set_redline", l_0_1, l_0_0)
end
)((string.lower)((this_sigattrlog[6]).utf8p2))
    end
    if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
      (function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_1, l_0_2, l_0_0
  local l_2_1 = 0
  if l_0_1 == nil or l_2_0 == nil or l_0_2 == nil then
    return 
  end
  for l_2_5,l_2_6 in ipairs(l_0_1) do
    if l_2_6 == l_2_0 then
      l_2_1 = 1
      break
    end
  end
  do
    if l_2_1 == 0 then
      return 
    end
    for l_2_10,l_2_11 in ipairs(l_0_2) do
      if l_2_11 == l_2_0 then
        return 
      end
    end
    ;
    (table.insert)(l_0_2, l_2_0)
    ;
    (MpCommon.SetPersistContextNoPath)("procCreated_set_redline", l_0_2, l_0_0)
  end
end
)((string.lower)((this_sigattrlog[7]).utf8p1))
    end
    if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil and (function(l_3_0)
  -- function num : 0_2 , upvalues : l_0_2, l_0_r3, l_0_0
  if l_0_2 == nil or l_3_0 == nil or l_0_r3 == nil then
    return false
  end
  for l_3_4,l_3_5 in ipairs(l_0_r3) do
    if l_3_5 == l_3_0 then
      return false
    end
  end
  for l_3_9,l_3_10 in ipairs(l_0_2) do
    if (string.find)(l_3_10, l_3_0, 1, true) then
      (table.insert)(l_0_r3, l_3_0)
      if #l_0_r3 >= 2 then
        return true
      end
      ;
      (MpCommon.SetPersistContextNoPath)("procInj_set_redline", l_0_r3, l_0_0)
      return false
    end
  end
  return false
end
)("\\" .. (string.lower)((this_sigattrlog[9]).utf8p1)) then
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC148: freeLocal<0 in 'ReleaseLocals'

  end
end

