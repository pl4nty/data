-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb373d14ef5\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[4]
if isnull(l_0_0) or not l_0_0.matched or isnull(l_0_0.utf8p2) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
if type(l_0_1) ~= "string" or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = (string.sub)(l_1_0, l_1_1, l_1_1)
  do
    local l_1_3 = (string.sub)(l_1_0, l_1_1 + 1, l_1_1 + 2)
    do return (not isnull((string.match)(l_1_2, "^%a$")) and l_1_3 == ":\\") or (string.sub)(l_1_0, l_1_1, l_1_1 + 1) == "\\\\" end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

local l_0_4 = nil
if isnull((function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_2
  if (string.sub)(l_2_0, 1, 7) ~= "Config=" then
    return nil
  end
  local l_2_1 = ";Assembly="
  local l_2_2 = 8
  while 1 do
    if l_2_2 <= #l_2_0 then
      local l_2_3, l_2_4 = (string.find)(l_2_0, l_2_1, l_2_2, true)
      if isnull(l_2_3) then
        return nil
      end
      local l_2_5 = l_2_4 + 1
      if l_2_3 > 8 and l_0_2(l_2_0, l_2_5) then
        local l_2_6 = string.sub
        local l_2_7 = l_2_0
        do
          local l_2_8 = l_2_5
          do return l_2_6(l_2_7, l_2_8) end
          -- DECOMPILER ERROR at PC44: Confused about usage of register R7 for local variables in 'ReleaseLocals'

          l_2_2 = l_2_4 + 1
          -- DECOMPILER ERROR at PC45: Confused about usage of register R6 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  l_2_3 = nil
  return l_2_3
end
)(l_0_1)) then
  return mp.CLEAN
end
do
  local l_0_5, l_0_6 = , pcall(mp.IsKnownFriendlyFile, (function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_2
  if (string.sub)(l_2_0, 1, 7) ~= "Config=" then
    return nil
  end
  local l_2_1 = ";Assembly="
  local l_2_2 = 8
  while 1 do
    if l_2_2 <= #l_2_0 then
      local l_2_3, l_2_4 = (string.find)(l_2_0, l_2_1, l_2_2, true)
      if isnull(l_2_3) then
        return nil
      end
      local l_2_5 = l_2_4 + 1
      if l_2_3 > 8 and l_0_2(l_2_0, l_2_5) then
        local l_2_6 = string.sub
        local l_2_7 = l_2_0
        do
          local l_2_8 = l_2_5
          do return l_2_6(l_2_7, l_2_8) end
          -- DECOMPILER ERROR at PC44: Confused about usage of register R7 for local variables in 'ReleaseLocals'

          l_2_2 = l_2_4 + 1
          -- DECOMPILER ERROR at PC45: Confused about usage of register R6 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  l_2_3 = nil
  return l_2_3
end
)(l_0_1), true, false)
  if not l_0_6 or isnull(R8_PC54) or mp.IsKnownFriendlyFile then
    return mp.CLEAN
  end
  ;
  (bm.add_threat_file)(R8_PC54)
  -- DECOMPILER ERROR at PC67: Overwrote pending register: R8 in 'AssignReg'

  TrackPidAndTechniqueBM(R8_PC54, "T1574.014", "AppDomainMgrSuspAssembly", 86400)
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC75: freeLocal<0 in 'ReleaseLocals'

end

