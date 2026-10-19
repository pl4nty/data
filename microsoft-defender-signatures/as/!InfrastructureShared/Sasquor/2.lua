-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Sasquor\2.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = string.gsub
  local l_1_2 = l_1_0
  local l_1_3 = "(%W)"
  do
    local l_1_4 = "%%%1"
    do return l_1_1(l_1_2, l_1_3, l_1_4) end
    -- DECOMPILER ERROR at PC7: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

do
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R4 in 'UnsetPending'

  if not (function(l_5_0)
  -- function num : 0_4 , upvalues : l_0_1, l_0_2, l_0_3
  if l_5_0 == nil then
    return false
  end
  local l_5_1 = (string.lower)(tostring(l_5_0))
  local l_5_2 = {}
  -- DECOMPILER ERROR at PC13: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC14: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC15: Overwrote pending register: R4 in 'AssignReg'

  for l_5_6,l_5_7 in ("([%a_$][%w_$]*)%s*=%s*new%s+xmlhttprequest%s*%(")("([%a_$][%w_$]*)%s*=%s*new%s+window%.xmlhttprequest%s*%(") do
    local l_5_8, l_5_9, l_5_10 = (string.find)(l_5_1, l_5_7, 1)
    while 1 do
      if l_5_8 ~= nil then
        do
          if (not l_0_1(l_5_1, l_5_10, "open", l_5_9 + 1) or l_0_1(l_5_1, l_5_10, "send", l_5_9 + 1)) and (l_0_2(l_5_1, l_5_10, l_5_9 + 1) or l_0_3(l_5_1, l_5_10, l_5_9 + 1)) then
            return true
          end
          l_5_8 = (string.find)(l_5_1, l_5_7, l_5_9 + 1)
          -- DECOMPILER ERROR at PC67: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC67: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return false
end
)(headerpage) and not (function(l_5_0)
  -- function num : 0_4 , upvalues : l_0_1, l_0_2, l_0_3
  if l_5_0 == nil then
    return false
  end
  local l_5_1 = (string.lower)(tostring(l_5_0))
  local l_5_2 = {}
  -- DECOMPILER ERROR at PC13: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC14: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC15: Overwrote pending register: R4 in 'AssignReg'

  for l_5_6,l_5_7 in ("([%a_$][%w_$]*)%s*=%s*new%s+xmlhttprequest%s*%(")("([%a_$][%w_$]*)%s*=%s*new%s+window%.xmlhttprequest%s*%(") do
    local l_5_8, l_5_9, l_5_10 = (string.find)(l_5_1, l_5_7, 1)
    while 1 do
      if l_5_8 ~= nil then
        do
          if (not l_0_1(l_5_1, l_5_10, "open", l_5_9 + 1) or l_0_1(l_5_1, l_5_10, "send", l_5_9 + 1)) and (l_0_2(l_5_1, l_5_10, l_5_9 + 1) or l_0_3(l_5_1, l_5_10, l_5_9 + 1)) then
            return true
          end
          l_5_8 = (string.find)(l_5_1, l_5_7, l_5_9 + 1)
          -- DECOMPILER ERROR at PC67: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC67: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return false
end
)(footerpage) then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC27: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

