-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b38ce5cfcb\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if not l_1_0.matched then
    return false
  end
  local l_1_1 = l_1_0.utf8p2
  if l_1_1 == nil then
    return false
  end
  l_1_1 = (string.lower)(l_1_1)
  if not (string.find)(l_1_1, " -command -", 1, true) then
    return false
  end
  if not (string.find)(l_1_1, "-nop", 1, true) and not (string.find)(l_1_1, "-noprofile", 1, true) then
    return false
  end
  if not (string.find)(l_1_1, "-noni", 1, true) and not (string.find)(l_1_1, "-noninteractive", 1, true) then
    return false
  end
  return true
end

do
  if not l_0_0(this_sigattrlog[2]) then
    local l_0_1 = l_0_0(this_sigattrlog[3])
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1059.001", "rundll32_ps_stdin")
  return mp.INFECTED
end

