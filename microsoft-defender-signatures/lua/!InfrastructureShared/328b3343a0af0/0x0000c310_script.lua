-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\328b3343a0af0\0x0000c310_luac 

-- params : ...
-- function num : 0
local l_0_0 = false
do
  if ((((this_sigattrlog[15]).matched and (this_sigattrlog[15]).utf8p2) or ((this_sigattrlog[16]).matched and (this_sigattrlog[16]).utf8p2) or ((this_sigattrlog[17]).matched and (this_sigattrlog[17]).utf8p2) or (this_sigattrlog[18]).matched)) then
    local l_0_1, l_0_2, l_0_3 = (this_sigattrlog[18]).utf8p2
  end
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_4 = nil
  do
    if not (string.match)(l_0_1, "Uri=([^;]+)") then
      local l_0_5 = nil
      if not (string.match)(l_0_4, "DestIp=([^;]*);") or not isPublicIP((string.match)(l_0_4, "DestIp=([^;]*);")) then
        return mp.CLEAN
      end
      l_0_0 = true
    end
    local l_0_6 = nil
    if not l_0_0 then
      if not (string.find)(l_0_6, "%.") then
        return mp.CLEAN
      end
      if (mp.CheckUrl)(l_0_6) == 1 and l_0_6 == 1 then
        return mp.CLEAN
      end
    end
    local l_0_7 = {SIG_CONTEXT = "DLL_LOAD_1", CONTENT_SOURCE = "BM", TAG = "INTERFLOW"}
    local l_0_8 = SafeGetUrlReputation
    l_0_8 = l_0_8({l_0_6}, l_0_7, false, 2000)
    if (l_0_8.urls)[l_0_6] and ((l_0_8.urls)[l_0_6]).determination == 2 and ((l_0_8.urls)[l_0_6]).confidence >= 60 then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

