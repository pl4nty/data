-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41b36e318a30\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[3]).matched then
    local l_0_0, l_0_1 = (this_sigattrlog[3]).utf8p2
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = nil
  if not (string.match)(l_0_0, "DestIp=([^;]*);") or not isPublicIP((string.match)(l_0_0, "DestIp=([^;]*);")) then
    return mp.CLEAN
  end
  return mp.INFECTED
end

