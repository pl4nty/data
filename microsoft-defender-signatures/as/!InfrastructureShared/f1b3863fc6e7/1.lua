-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f1b3863fc6e7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
do
  if ((((this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2) or ((this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2) or ((this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2) or (this_sigattrlog[5]).matched)) then
    local l_0_1, l_0_2, l_0_3 = (this_sigattrlog[5]).utf8p2
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
    -- DECOMPILER ERROR at PC80: Overwrote pending register: R3 in 'AssignReg'

    if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p2 == nil or isnull(nil) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R3 in 'UnsetPending'

    local l_0_7 = nil
    if ((nil):lower()):match("node%.exe\"?%s+\"?([^\"]+%.js)\"?") then
      (bm.add_related_file)(((nil):lower()):match("node%.exe\"?%s+\"?([^\"]+%.js)\"?"))
    end
    local l_0_8 = nil
    if not l_0_0 then
      if not (string.find)(l_0_6, "%.") then
        return mp.CLEAN
      end
      if (mp.CheckUrl)(l_0_6) == 1 and l_0_6 == 1 then
        return mp.CLEAN
      end
    end
    local l_0_9 = {SIG_CONTEXT = "NODE_JS", CONTENT_SOURCE = "BM", TAG = "INTERFLOW"}
    local l_0_10 = SafeGetUrlReputation
    l_0_10 = l_0_10({l_0_6}, l_0_9, false, 2000)
    if (l_0_10.urls)[l_0_6] and ((l_0_10.urls)[l_0_6]).determination == 2 and ((l_0_10.urls)[l_0_6]).confidence >= 60 then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

