-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\497b30a73a572\0x00000b2b_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0 = nil
  if not (string.match)(l_0_0, "delete%-snapshot") and not (string.match)(l_0_0, "delete%-volume") then
    return mp.CLEAN
  end
else
  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
      local l_0_1 = (this_sigattrlog[2]).utf8p2
      if not (string.match)(l_0_1, "snapshot delete") and not (string.match)(l_0_1, "disk delete") then
        return mp.CLEAN
      end
    else
      do
        do
          if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
            local l_0_2, l_0_3 = (this_sigattrlog[3]).utf8p2
            l_0_3 = string
            l_0_3 = l_0_3.match
            l_0_3 = l_0_3(l_0_2, "snapshots delete")
            if not l_0_3 then
              l_0_3 = string
              l_0_3 = l_0_3.match
              l_0_3 = l_0_3(l_0_2, "disks delete")
              if not l_0_3 then
                l_0_3 = mp
                l_0_3 = l_0_3.CLEAN
                return l_0_3
              end
            end
          end
          TrackPidAndTechniqueBM("BM", "T1490", "Impact_InhibitSystemRecovery")
          return mp.INFECTED
        end
      end
    end
  end
end

