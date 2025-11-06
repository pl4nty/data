-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a1b33c219973\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[4]).matched then
    local l_0_0, l_0_1, l_0_2 = (this_sigattrlog[4]).utf8p2
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_3 = nil
  do
    if not (string.match)(l_0_0, "Uri=([^;]+)") then
      local l_0_4 = nil
      if not (string.match)(l_0_3, "DestIp=([^;]*);") or not isPublicIP((string.match)(l_0_3, "DestIp=([^;]*);")) then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

