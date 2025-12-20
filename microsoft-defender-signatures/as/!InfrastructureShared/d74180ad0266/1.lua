-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d74180ad0266\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC33: Overwrote pending register: R1 in 'AssignReg'

do
  if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[1]).matched) and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  if not nil then
    return mp.CLEAN
  end
  local l_0_2 = nil
  local l_0_0 = nil
  do
    local l_0_4 = nil
    if (function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_r2
  if type(l_2_0) ~= "string" then
    return false
  end
  local l_2_1 = l_2_0:match("https?://[^/]+(/.+)")
  if not l_2_1 then
    return false
  end
  local l_2_2 = l_0_r2(l_2_1)
  local l_2_3 = (string.char)(27)
  local l_2_4 = (string.char)(7)
  do
    local l_2_5 = l_2_3 .. "%]0;.-" .. l_2_4
    do return l_2_2:find(l_2_5, 1, false) ~= nil end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end
)((function(l_1_0)
  -- function num : 0_0
  local l_1_1, l_1_2 = l_1_0:gsub, l_1_0
  local l_1_3 = "%%(%x%x)"
  do
    local l_1_4 = function(l_2_0)
    -- function num : 0_0_0
    local l_2_1 = string.char
    do
      local l_2_2, l_2_3, l_2_4 = tonumber(l_2_0, 16), .end
      do return l_2_1(l_2_2, l_2_3, l_2_4) end
      -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end

    do return l_1_1(l_1_2, l_1_3, l_1_4) end
    -- DECOMPILER ERROR at PC5: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end
)(l_0_0)) then
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC61: freeLocal<0 in 'ReleaseLocals'

  end
end

