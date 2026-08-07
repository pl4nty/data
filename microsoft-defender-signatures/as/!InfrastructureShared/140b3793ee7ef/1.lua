-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\140b3793ee7ef\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_3 = nil, nil, nil
  end
  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
      local l_0_2, l_0_4 = , (string.lower)((this_sigattrlog[2]).utf8p2)
    end
    do
      if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
        local l_0_5 = nil
      end
      -- DECOMPILER ERROR at PC67: Overwrote pending register: R3 in 'AssignReg'

      do
        if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
          local l_0_6 = nil
        end
        -- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

        if l_0_6 == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC73: Confused about usage of register: R1 in 'UnsetPending'

        if l_0_4 == nil then
          return mp.CLEAN
        end
        if (string.lower)((this_sigattrlog[3]).utf8p1) == nil then
          return mp.CLEAN
        end
        if nil == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

        local l_0_7 = nil
        if (string.match)(l_0_6, "([^\\]+%.exe)$") == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC100: Confused about usage of register: R1 in 'UnsetPending'

        if not (string.find)(l_0_4, (string.match)(l_0_6, "([^\\]+%.exe)$"), 1, true) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC112: Confused about usage of register: R2 in 'UnsetPending'

        local l_0_8 = nil
        -- DECOMPILER ERROR at PC117: Confused about usage of register: R3 in 'UnsetPending'

        local l_0_9 = nil
        if (string.match)((string.lower)((this_sigattrlog[3]).utf8p1), "([^\\]+)$") == nil or (string.match)(nil, "([^\\]+)$") == nil then
          return mp.CLEAN
        end
        if (string.match)((string.lower)((this_sigattrlog[3]).utf8p1), "([^\\]+)$") ~= (string.match)(nil, "([^\\]+)$") then
          return mp.CLEAN
        end
        local l_0_10 = nil
        if (string.sub)((string.match)((string.lower)((this_sigattrlog[3]).utf8p1), "([^\\]+)$"), -4) == ".exe" and not ({["brave.exe"] = true, ["chrome.exe"] = true, ["msedge.exe"] = true, ["opera.exe"] = true})[(string.match)((string.lower)((this_sigattrlog[3]).utf8p1), "([^\\]+)$")] then
          return mp.CLEAN
        end
        TrackPidAndTechniqueBM("BM", "T1547.001", "PhantomStealerRunKey")
        TrackPidAndTechniqueBM("BM", "T1055", "PhantomStealerBrowserInject")
        return mp.INFECTED
      end
    end
  end
end

