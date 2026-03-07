-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f6b33cec3f57\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p2 ~= nil then
      local l_0_1 = (this_sigattrlog[4]).utf8p2
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p2 == nil or (this_sigattrlog[7]).matched) and (this_sigattrlog[7]).utf8p2 ~= nil then
        local l_0_2 = (this_sigattrlog[6]).utf8p2
      else
      end
      -- DECOMPILER ERROR at PC96: Overwrote pending register: R0 in 'AssignReg'

      do
        if (not (this_sigattrlog[8]).matched or (this_sigattrlog[8]).utf8p2 == nil or (this_sigattrlog[9]).matched) and (this_sigattrlog[9]).utf8p2 ~= nil then
          local l_0_3 = (this_sigattrlog[8]).utf8p2
        else
        end
        -- DECOMPILER ERROR at PC124: Overwrote pending register: R0 in 'AssignReg'

        do
          if (not (this_sigattrlog[10]).matched or (this_sigattrlog[10]).utf8p2 == nil or (this_sigattrlog[11]).matched) and (this_sigattrlog[11]).utf8p2 ~= nil then
            local l_0_4, l_0_5 = (this_sigattrlog[10]).utf8p2
          end
          -- DECOMPILER ERROR at PC125: Confused about usage of register: R0 in 'UnsetPending'

          if l_0_4 == nil then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC132: Confused about usage of register: R0 in 'UnsetPending'

          local l_0_6 = nil
          local l_0_7 = (string.lower)(l_0_4)
          if not contains(l_0_7, {"/dev/tcp/", "bash -i >& /dev/", "mkfifo", "nc -e /bin/", "ncat -e /bin/", "| bash", "| sh", "-o /tmp/", "crontab -e", "crontab -r", "/etc/cron", "authorized_keys", "/etc/shadow", "+x /tmp/", "chmod 777"}) then
            return mp.CLEAN
          end
          TrackPidAndTechniqueBM("BM", "T1059", "Execution")
          add_parents()
          return mp.INFECTED
        end
      end
    end
  end
end

